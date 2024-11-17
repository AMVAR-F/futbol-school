import React, { useState } from 'react';
import { Button, Container, Row, Col, Card, CardBody, CardHeader, ListGroup, ListGroupItem, Modal, ModalHeader, ModalBody, ModalFooter, Input, FormGroup, Label, Badge } from 'reactstrap';
import { teamsData } from './initialData';
import SearchTeamBar from './SearchTeamBar';

const categories = [
  "Semillitas", "Teteritos", "Compoticas", "Sub7", "Sub9", "Sub11", "Sub13", "Sub17", "Sub20", 
  "Categoria Libre", "Veteranos", "Supra 50"
];

const initialGroups = categories.reduce((acc, category) => {
  acc[category] = Array.from({ length: 5 }, (_, index) => ({
    name: String.fromCharCode(65 + index), // 'A', 'B', 'C', 'D', 'E'
    head: null,
    teams: []
  }));
  return acc;
}, {});

const App = () => {
  const [groups, setGroups] = useState(initialGroups);
  const [assignHeadsModalOpen, setAssignHeadsModalOpen] = useState(false);
  const [enrollTeamsModalOpen, setEnrollTeamsModalOpen] = useState(false);
  const [currentCategory, setCurrentCategory] = useState("");
  const [selectedGroupIndex, setSelectedGroupIndex] = useState(0);

  const toggleAssignHeadsModal = (category) => {
    setCurrentCategory(category);
    setAssignHeadsModalOpen(!assignHeadsModalOpen);
  };

  const toggleEnrollTeamsModal = (category, index) => {
    setCurrentCategory(category);
    setSelectedGroupIndex(index);
    setEnrollTeamsModalOpen(!enrollTeamsModalOpen);
  };

  const handleSelectHead = (team, groupIndex) => {
    const updatedGroups = { ...groups };
    updatedGroups[currentCategory][groupIndex].head = team;
    setGroups(updatedGroups);
  };

  const handleSelectTeam = (team) => {
    const updatedGroups = { ...groups };
    const group = updatedGroups[currentCategory][selectedGroupIndex];
    if (!group.teams.some(t => t.id === team.id)) {
      group.teams.push(team);
    }
    setGroups(updatedGroups);
  };

  const handleRemoveTeam = (teamId) => {
    const updatedGroups = { ...groups };
    const group = updatedGroups[currentCategory][selectedGroupIndex];
    group.teams = group.teams.filter(team => team.id !== teamId);
    setGroups(updatedGroups);
  };

  return (
    <Container>
      <h2>Team Management</h2>
      {categories.map(category => (
        <div key={category}>
          <h2>{category}</h2>
          <Button color="primary" onClick={() => toggleAssignHeadsModal(category)}>Assign Group Heads</Button>
          <Row className="mt-3">
            {groups[category].map((group, index) => (
              <Col md="6" key={group.name} className="mb-4">
                <Card>
                  <CardHeader className="bg-info text-white">Group {group.name}</CardHeader>
                  <CardBody>
                    <h5>Head: {group.head ? group.head.name : "Not Assigned"}</h5>
                    <ListGroup className="mt-3">
                      {group.teams.map(team => (
                        <ListGroupItem key={team.id}>
                          <Row className="align-items-center">
                            <Col xs="3">
                              <img src={team.image} alt={team.name} style={{ width: 30, borderRadius: "50%" }} />
                            </Col>
                            <Col>{team.name}</Col>
                            <Col xs="2">
                              <Badge color="danger" onClick={() => handleRemoveTeam(team.id)} style={{ cursor: 'pointer' }}>X</Badge>
                            </Col>
                          </Row>
                        </ListGroupItem>
                      ))}
                    </ListGroup>
                    <Button color="info" className="mt-3" onClick={() => toggleEnrollTeamsModal(category, index)}>Enroll Teams</Button>
                  </CardBody>
                </Card>
              </Col>
            ))}
          </Row>
        </div>
      ))}

      {/* Modal Assign Heads */}
      <Modal isOpen={assignHeadsModalOpen} toggle={() => toggleAssignHeadsModal("")}>
        <ModalHeader toggle={() => toggleAssignHeadsModal("")} className="bg-primary text-white">Assign Group Heads for {currentCategory}</ModalHeader>
        <ModalBody>
          {groups[currentCategory]?.map((group, index) => (
            <div key={index}>
              <h5>Group {group.name}</h5>
              <SearchTeamBar onSelectTeam={(team) => handleSelectHead(team, index)} />
              {group.head && (
                <ListGroup className="mt-2">
                  <ListGroupItem>{group.head.name}</ListGroupItem>
                </ListGroup>
              )}
            </div>
          ))}
        </ModalBody>
        <ModalFooter>
          <Button color="secondary" onClick={() => toggleAssignHeadsModal("")}>Close</Button>
        </ModalFooter>
      </Modal>

      {/* Modal Enroll Teams */}
      <Modal isOpen={enrollTeamsModalOpen} toggle={() => toggleEnrollTeamsModal("", 0)}>
        <ModalHeader toggle={() => toggleEnrollTeamsModal("", 0)} className="bg-primary text-white">Enroll Teams in {currentCategory} - Group {groups[currentCategory]?.[selectedGroupIndex]?.name}</ModalHeader>
        <ModalBody>
          <SearchTeamBar onSelectTeam={handleSelectTeam} />
          {groups[currentCategory]?.[selectedGroupIndex]?.teams.length > 0 && (
            <ListGroup className="mt-2">
              {groups[currentCategory][selectedGroupIndex].teams.map(team => (
                <ListGroupItem key={team.id}>
                  <Row className="align-items-center">
                    <Col xs="3">
                      <img src={team.image} alt={team.name} style={{ width: 50, height: 50, borderRadius: "50%" }} />
                    </Col>
                    <Col>{team.name}</Col>
                    <Col xs="2">
                      <Badge color="danger" onClick={() => handleRemoveTeam(team.id)} style={{ cursor: 'pointer' }}>X</Badge>
                    </Col>
                  </Row>
                </ListGroupItem>
              ))}
            </ListGroup>
          )}
        </ModalBody>
        <ModalFooter>
          <Button color="secondary" onClick={() => toggleEnrollTeamsModal("", 0)}>Close</Button>
        </ModalFooter>
      </Modal>
    </Container>
  );
};

export default App;
