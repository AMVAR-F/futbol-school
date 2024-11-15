import React, { useState } from "react";
import "bootstrap/dist/css/bootstrap.min.css";
import {
    Table,
    Button,
    Modal,
    Container,
    ModalHeader,
    ModalBody,
    FormGroup,
    ModalFooter,
} from "reactstrap";

const initialData = [
    { id: 1, name_team: "Tariba Lions", technical_director: "Alejandro Torres", color: "yellow and black", isActive: true },
    { id: 2, name_team: "Peribeca Tigers", technical_director: "Luis Caceres", color: "red and black", isActive: true },
    { id: 3, name_team: "Tucape Panthers", technical_director: "Pedro Vargas", color: "blue and black", isActive: true },
    { id: 4, name_team: "Pirineos Bears", technical_director: "Alejo Torre", color: "green and black", isActive: true }
];

const App = () => {
    const [data, setData] = useState(initialData);
    const [modal, setModal] = useState({ insert: false, update: false, disable: false, view: false, enable: false });
    const [selectedUser, setSelectedUser] = useState(null);
    const [form, setForm] = useState({
        id: "",
        name_team: "",
        technical_director: "",
        isActive: true,
        color: ""
    });

    const toggleModal = (type, team = null) => {
        setModal((prevState) => ({ ...prevState, [type]: !prevState[type] }));
        setSelectedUser(team);
        if (type === "insert" || type === "update") setForm(team || { ...form, id: data.length + 1 });
    };

    const handleChange = (e) => {
        const { name, value } = e.target;
        setForm((prevForm) => ({ ...prevForm, [name]: value }));
    };

    //   const handleFileChange = (e) => {
    //     const file = e.target.files[0];
    //     if (file && file.size > 50 * 1024 * 1024) {
    //       alert("File size exceeds 50 MB");
    //     } else {
    //       setForm((prevForm) => ({ ...prevForm, image: file }));
    //     }
    //   };

    const handleInsert = () => {
        setData([...data, { ...form, isActive: true }]);
        toggleModal("insert");
    };

    const handleEdit = () => {
        setData(data.map((item) => (item.id === form.id ? form : item)));
        toggleModal("update");
    };

    const handleDisable = () => {
        setData(data.map((item) => (item.id === selectedUser.id ? { ...item, isActive: false } : item)));
        toggleModal("disable");
    };
    const handleEnable = () => {
        setData(data.map((item) => (item.id === selectedUser.id ? { ...item, isActive: true } : item)));
        toggleModal("enable");
    };


    return (
        <Container>
            <Button color="primary" onClick={() => toggleModal("insert")}>Create</Button>
            <Table>
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Name Team</th>
                        <th>Technical director</th>
                        <th>Color</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    {data.map((team) => (
                        <tr key={team.id} style={{ color: team.isActive ? "black" : "gray" }}>
                            <td>{team.id}</td>
                            <td>{team.name_team}</td>
                            <td>{team.technical_director}</td>
                            <td>{team.color}</td>
                            <td>{team.isActive ? "Active" : "Disabled"}</td>
                            <td>
                                <Button color="success" onClick={() => toggleModal("update", team)} disabled={!team.isActive}>Edit</Button>{" "}
                                <Button color="warning" onClick={() => toggleModal("disable", team)} disabled={!team.isActive}>Disable</Button>{" "}
                                <Button color="primary" onClick={() => toggleModal("enable", team)} disabled={team.isActive}>Enable</Button>{" "}
                                <Button color="info" onClick={() => toggleModal("view", team)}>View</Button>

                            </td>
                        </tr>
                    ))}
                </tbody>
            </Table>

            {/* Modal de Inserción */}
            <Modal isOpen={modal.insert} toggle={() => toggleModal("insert")}>
                <ModalHeader toggle={() => toggleModal("insert")}>Insert team</ModalHeader>
                <ModalBody>
                    <FormGroup>
                        <label>Select Technical Director</label>
                        <select
                            name="technical_director"
                            className="form-control"
                            value={form.technical_director}
                            onChange={handleChange}
                        >
                            <option value="">Select a technical director</option>
                            {data.map((team, index) => (
                                <option key={index} value={team.technical_director}>
                                    {team.technical_director}
                                </option>
                            ))}
                        </select>
                    </FormGroup>
                </ModalBody>
                <ModalFooter>
                    <Button color="primary" onClick={handleInsert}>Insert</Button>
                    <Button color="secondary" onClick={() => toggleModal("insert")}>Cancel</Button>
                </ModalFooter>
            </Modal>

            {/* Modal de Edición */}
            <Modal isOpen={modal.update} toggle={() => toggleModal("update")}>
                <ModalHeader toggle={() => toggleModal("update")}>Edit team</ModalHeader>
                <ModalBody>
                    <FormGroup>
                        <label>DNI</label>
                        <input type="text" name="dni" className="form-control" value={form.id} onChange={handleChange} required maxLength="8" />
                    </FormGroup>
                    {/* Otros campos del formulario aquí */}
                </ModalBody>
                <ModalFooter>
                    <Button color="primary" onClick={handleEdit}>Save Changes</Button>
                    <Button color="secondary" onClick={() => toggleModal("update")}>Cancel</Button>
                </ModalFooter>
            </Modal>

            {/* Modal de Habilitación */}
            <Modal isOpen={modal.enable} toggle={() => toggleModal("enable")}>
                <ModalHeader toggle={() => toggleModal("enable")}>Confirm Enable</ModalHeader>
                <ModalBody>
                    Are you sure you want to enable the team <b>{selectedUser && selectedUser.firstname}</b>?
                </ModalBody>
                <ModalFooter>
                    <Button color="success" onClick={handleEnable}>Enable</Button>
                    <Button color="secondary" onClick={() => toggleModal("enable")}>Cancel</Button>
                </ModalFooter>
            </Modal>


            {/* Modal de Deshabilitación */}
            <Modal isOpen={modal.disable} toggle={() => toggleModal("disable")}>
                <ModalHeader toggle={() => toggleModal("disable")}>Confirm Disable</ModalHeader>
                <ModalBody>
                    Are you sure you want to disable the team <b>{selectedUser && selectedUser.firstname}</b>?
                </ModalBody>
                <ModalFooter>
                    <Button color="warning" onClick={handleDisable}>Disable</Button>
                    <Button color="secondary" onClick={() => toggleModal("disable")}>Cancel</Button>
                </ModalFooter>
            </Modal>

            {/* Modal de Visualización */}
            <Modal isOpen={modal.view} toggle={() => toggleModal("view")}>
                <ModalHeader toggle={() => toggleModal("view")}>team Details</ModalHeader>
                <ModalBody>
                    {selectedUser && (
                        <>
                            <p><b>Id:</b> {selectedUser.id}</p>
                            <p><b>First Name:</b> {selectedUser.id}</p>
                            <p><b>Last Name:</b> {selectedUser.team_name}</p>
                            <p><b>Color:</b> {selectedUser.color}</p>
                            <p><b>Status:</b> {selectedUser.isActive ? "Active" : "Disabled"}</p>
                        </>
                    )}
                </ModalBody>
                <ModalFooter>
                    <Button color="secondary" onClick={() => toggleModal("view")}>Close</Button>
                </ModalFooter>
            </Modal>
        </Container>
    );
};

export default App;
