import './cssfiles/App.css'

function Home() {

  return (
    <>
      <div className="topbar">
        <button className="option"> Notes </button>
        <button className="option"> Tags </button>
      </div>
      <div>
        <button className="newnote" > + Create New Note</button>
      </div>
      
      
    </>
  )
}

export default Home
