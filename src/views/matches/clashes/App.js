import React, { useState } from 'react';
import { Button } from 'react-bootstrap';
import MatchupFormModal from './components/MatchupForm';
import MatchupTable from './components/MatchupTable';

const categories = [
  "Semillitas", "Teteritos", "Compoticas", "Sub 7", "Sub 9", "Sub 11", "Sub 13", "Sub 17", "Sub 20", "Categoria Libre", "Veteranos", "Supra 50"
];

const initialData = [
  { id: 1, name_team: "Tariba Lions", technical_director: "Alejandro Torres", color: "yellow and black", isActive: true, homeColor: "#ffff00", awayColor: "#000000", members: [], photo: "" },
  { id: 2, name_team: "Peribeca Tigers", technical_director: "Luis Caceres", color: "red and black", isActive: true, homeColor: "#ff0000", awayColor: "#000000", members: [], photo: "" },
  { id: 3, name_team: "Tucape Panthers", technical_director: "Pedro Vargas", color: "blue and black", isActive: true, homeColor: "#0000ff", awayColor: "#000000", members: [], photo: "" },
  { id: 4, name_team: "Pirineos Bears", technical_director: "Alejo Torre", color: "green and black", isActive: true, homeColor: "#00ff00", awayColor: "#000000", members: [], photo: "" }
];

const App = () => {
  const [matchups, setMatchups] = useState({});
  const [showModal, setShowModal] = useState(false);

  const addMatchup = (matchup) => {
    setMatchups((prevMatchups) => {
      const updatedMatchups = { ...prevMatchups };
      if (!updatedMatchups[matchup.category]) {
        updatedMatchups[matchup.category] = [];
      }
      updatedMatchups[matchup.category].push(matchup);
      return updatedMatchups;
    });
  };

  const handleShow = () => setShowModal(true);
  const handleClose = () => setShowModal(false);

  return (
    <div className="container">
    
      <Button variant="btn btn-outline-primary" onClick={handleShow}>
        Add Matchup
      </Button>
      <MatchupFormModal
        show={showModal}
        handleClose={handleClose}
        categories={categories}
        teams={initialData}
        addMatchup={addMatchup}
      />
      <MatchupTable matchups={matchups} />
    </div>
  );
};

export default App;
