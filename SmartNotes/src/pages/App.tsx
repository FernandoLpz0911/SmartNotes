import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import './cssfiles/App.css'

import Home from './Home.tsx';
import Note from './Note.tsx';
import Tag from './Tag.tsx';

function App() {
  return (
    <>
      <Routes>
        <Route path="/" element={<Home/>} />
        <Route path="/Note" element={<Note/>} />
        <Route path="/Tag" element={<Tag/>} />
        <Route path="/UserAuth" element={<Home/>} />
        <Route path="/Settings" element={<Home/>} />
      </Routes>
    </>
  )
}

export default App
