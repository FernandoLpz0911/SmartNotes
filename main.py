# main.py
from fastapi import FastAPI # import web API framework, literally imports fast api use
from pydantic import BaseModel # import data validation. BaseModel checks thr struct formatting to validate data
from typing import List, Dict # code readability from typing library specific to lists and dictionaries
from transformers import pipeline # high-level API from Hugging Face for ease of using pre-trained models for tasks. We'll use it for summarizing
from keybert import KeyBERT # keyword extraction library. Using BERT embeddings to find the most relevant keywords/keyphrases. DON'T KNOW WHAT BERT EMBEDDINGS ARE

# Create a Fast API instance that it's own title, description of what it does, and version number for when we manage the API. DO NOT UNDERSTAND HOW IT WORKS
app = FastAPI(
    title="AI-Powered Personal Notes Assistant",
    description="An API for managing and analyzing personal notes using AI/ML.",
    version="0.1.0",
)

notes_db: List[Dict] = []   # global list of dictionary key-word pairs, completely clears on application restart for now
note_id_counter = 0         # note id counter

# load Hugging Face's pre-trained summarization model. DO NOT UNDERSTAND
summarizer = pipeline("summarization", model="sshleifer/distilbart-cnn-12-6")


kw_model = KeyBERT()    # Initializes KeyBERT model to default to use Sentence-Transformer model for the embeddings... DO NOT UNDERSTAND

# note input using only string, DO NOT UNDERSTAND
class NoteInput(BaseModel):
    content: str

# note output into integers, strings, and a list of string for the tag.
class NoteOutput(BaseModel):
    id: int
    content: str
    summary: str
    tags: List[str]

# 
@app.get("/")
async def root():
    return {"message": "Welcome to the AI-Powered Personal Notes Assistant API!"}


@app.post("/notes/", response_model=NoteOutput)
async def create_note(note: NoteInput):
    global note_id_counter
    note_id_counter += 1

    # 1. Summarize the note
    # Max length should be reasonable for a summary.
    # Min length prevents very short, unhelpful summaries.
    summary_results = summarizer(
        note.content, max_length=100, min_length=30, do_sample=False
    )
    summary = summary_results[0]["summary_text"]

    # 2. Extract keywords (tags)
    # top_n specifies how many keywords to extract.
    # diversity can be adjusted to get more varied keywords.
    keywords = kw_model.extract_keywords(
        note.content, keyphrase_ngram_range=(1, 2), stop_words="english", top_n=5
    )
    tags = [keyword[0] for keyword in keywords]  # Extracting just the keyword text

    new_note = {
        "id": note_id_counter,
        "content": note.content,
        "summary": summary,
        "tags": tags,
    }
    notes_db.append(new_note)
    return new_note


@app.get("/notes/", response_model=List[NoteOutput])
async def get_all_notes():
    return notes_db


@app.get("/notes/{note_id}", response_model=NoteOutput)
async def get_note_by_id(note_id: int):
    for note in notes_db:
        if note["id"] == note_id:
            return note
    # In a real app, you'd raise an HTTPException here
    return {"error": "Note not found"}