import { useState } from 'react'
import './App.css'

function App() {
  const [count, setCount] = useState(0)

  return (
    <>
      <div className="topbar">
        <button className="option"> Notes </button>
        <button className="option"> Tags </button>
      </div>
      
      
    </>
  )
}

export default App
