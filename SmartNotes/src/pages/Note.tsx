import "./cssfiles/Note.css";
import { Link } from 'react-router-dom';

function Note() {
    return (
        <>
            <div className="note-topbar">
                <button className="back-button">
                    <Link to="/Home"> Home/Submit Note to Server</Link>
                </button>
                <input type="text" className="note-title" id="note-title" name="title" placeholder="Title">
                
                </input>
            </div>

            <div className="page-note">
                <input type="text" id="note" name="note" placeholder="New Note">
                
                </input>
            </div>
        </>
    )
}

export default Note;