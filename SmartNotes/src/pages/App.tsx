import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import './cssfiles/App.css'

import Home from './Home.tsx';

function App() {
  return (
    <>
      <Routes>
        <Route path="/" element={<Home/>} />
        <Route path="/NewNote" element={<Home/>} />
        <Route path="/Tags" element={<Home/>} />
        <Route path="/UserAuth" element={<Home/>} />
        <Route path="/Settings" element={<Home/>} />
      </Routes>
    </>
  )
}

export default App
