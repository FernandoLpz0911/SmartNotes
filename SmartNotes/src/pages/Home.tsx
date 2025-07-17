import './cssfiles/App.css'
import { Link } from 'react-router-dom';

function Home() {

  return (
    <>
      <div className="topbar">

        <button className="option">
        <Link to="/">  Notes   </Link>
        </button>

        <button className="option">
          <Link to="/Tag">  Tags   </Link>
        </button>

      </div>
      <div>
        <button className="newnote" >
        <Link to="/Note" className="note"> + Create New Note </Link>
        </button>
      </div>
      
      
    </>
  )
}

export default Home
