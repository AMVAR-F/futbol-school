import React from "react";
import "bootstrap/dist/css/bootstrap.min.css";
import {
  Table,
  Button,
  Container,
  Modal,
  ModalHeader,
  ModalBody,
  FormGroup,
  ModalFooter,
} from "reactstrap";

const data = [
  // Ejemplo de datos iniciales
  { id: 1, firstname: "Alejandro", lastname: "Fernandez", dni: "29345789", typeofuser: "Technical Director" },
  { id: 2, firstname: "Juan", lastname: "Perez", dni: "12345678", typeofuser: "Referee" },
  // Más datos...
];

class App extends React.Component {
  state = {
    data: data,
    modalUpdate: false,
    modalInsert: false,
    form: {
      id: "",
      firstname: "",
      lastname: "",
      dni: "",
      typeofuser: "",
      image: null
    }
  };

  handleChange = (e) => {
    const { name, value } = e.target;
    this.setState({
      form: {
        ...this.state.form,
        [name]: value,
      }
    });
  };

  handleFileChange = (event) => {
    const file = event.target.files[0];
    if (file && file.size > 100 * 1024 * 1024) {
      alert("File size exceeds 100 MB");
      event.target.value = null;
    } else {
      this.setState({
        form: {
          ...this.state.form,
          image: file,
        }
      });
    }
  };

  viewModalInsert = () => {
    this.setState({ modalInsert: true, form: { id: "", firstname: "", lastname: "", dni: "", typeofuser: "", image: null } });
  };

  closeModalInsert = () => {
    this.setState({ modalInsert: false });
  };

  insert = () => {
    const newRecord = { ...this.state.form };
    newRecord.id = this.state.data.length + 1;
    const list = [...this.state.data, newRecord];
    this.setState({ data: list, modalInsert: false });
  };

  viewModalEdit = (element) => {
    this.setState({
      form: element,
      modalUpdate: true
    });
  };

  closeModalEdit = () => {
    this.setState({ modalUpdate: false });
  };

  edit = (form) => {
    const list = this.state.data.map(item => item.id === form.id ? form : item);
    this.setState({ data: list, modalUpdate: false });
  };

  delete = (form) => {
    const option = window.confirm("Do you want to delete this record with ID: " + form.id + "?");
    if (option) {
      const list = this.state.data.filter(item => item.id !== form.id);
      this.setState({ data: list });
    }
  };

  render() {
    return (
      <>
        <Container>
          <br />
          <Button color="btn btn-outline-primary" onClick={this.viewModalInsert}>Create</Button>

          <Table>
            <thead>
              <tr>
                <th>Id</th>
                <th>Firstname</th>
                <th>Lastname</th>
                <th>DNI</th>
                <th>Type of User</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              {this.state.data.map((element) => (
                <tr key={element.id}>
                  <td>{element.id}</td>
                  <td>{element.firstname}</td>
                  <td>{element.lastname}</td>
                  <td>{element.dni}</td>
                  <td>{element.typeofuser}</td>
                  <td>
                    <Button color="btn btn-outline-success" onClick={() => this.viewModalEdit(element)}>Edit</Button>{" "}
                    <Button color="btn btn-outline-danger" onClick={() => this.delete(element)}>Delete</Button>
                  </td>
                </tr>
              ))}
            </tbody>
          </Table>
        </Container>

        {/* Modal de Inserción */}
        <Modal isOpen={this.state.modalInsert}>
          <ModalHeader>
            <div><h3>Create</h3></div>
          </ModalHeader>

          <ModalBody>
            <FormGroup>
              <label htmlFor="dni">DNI</label>
              <input
                type="text"
                className="form-control"
                name="dni"
                id="dni"
                placeholder="Enter DNI"
                required
                pattern="\d{8}"
                maxLength="8"
                title="DNI must be 8 digits"
                onChange={this.handleChange}
              />
            </FormGroup>
            <FormGroup>
              <label htmlFor="firstname">First Name</label>
              <input
                type="text"
                className="form-control"
                name="firstname"
                id="firstname"
                required
                onChange={this.handleChange}
              />
            </FormGroup>
            <FormGroup>
              <label htmlFor="lastname">Last Name</label>
              <input
                type="text"
                className="form-control"
                name="lastname"
                id="lastname"
                required
                onChange={this.handleChange}
              />
            </FormGroup>
            <FormGroup>
              <label htmlFor="userType">Type of User</label>
              <select className="form-select" name="typeofuser" id="userType" required onChange={this.handleChange}>
                <option value="">Select one</option>
                <option value="Technical Director">Technical Director</option>
                <option value="Referee">Referee</option>
                <option value="Player">Player</option>
              </select>
            </FormGroup>
            <FormGroup>
              <label htmlFor="formFile">Upload Image</label>
              <input className="form-control" type="file" id="formFile" accept="image/*" onChange={this.handleFileChange} />
            </FormGroup>
          </ModalBody>

          <ModalFooter>
            <Button color="btn btn-outline-success" onClick={this.insert}>Insert</Button>
            <Button color="btn btn-outline-danger" onClick={this.closeModalInsert}>Cancel</Button>
          </ModalFooter>
        </Modal>

        {/* Modal de Edición */}
        <Modal isOpen={this.state.modalUpdate}>
          <ModalHeader>
            <div><h3>Edit</h3></div>
          </ModalHeader>

          <ModalBody>
            <FormGroup>
              <label htmlFor="dni">DNI</label>
              <input
                type="text"
                className="form-control"
                name="dni"
                id="dni"
                placeholder="Enter DNI"
                required
                pattern="\d{8}"
                maxLength="8"
                title="DNI must be 8 digits"
                value={this.state.form.dni}
                onChange={this.handleChange}
              />
            </FormGroup>
            <FormGroup>
              <label htmlFor="firstname">First Name</label>
              <input
                type="text"
                className="form-control"
                name="firstname"
                id="firstname"
                required
                value={this.state.form.firstname}
                onChange={this.handleChange}
              />
            </FormGroup>
            <FormGroup>
              <label htmlFor="lastname">Last Name</label>
              <input
                type="text"
                className="form-control"
                name="lastname"
                id="lastname"
                required
                value={this.state.form.lastname}
                onChange={this.handleChange}
              />
            </FormGroup>
            <FormGroup>
              <label htmlFor="userType">Type of User</label>
              <select className="form-select" name="typeofuser" id="userType" required value={this.state.form.typeofuser} onChange={this.handleChange}>
                <option value="">Select one</option>
                <option value="Technical Director">Technical Director</option>
                <option value="Referee">Referee</option>
                <option value="Player">Player</option>
              </select>
            </FormGroup>
            <FormGroup>
              <label htmlFor="formFile">Upload Image</label>
              <input className="form-control" type="file" id="formFile" accept="image/*" onChange={this.handleFileChange} />
            </FormGroup>
          </ModalBody>

          <ModalFooter>
            <Button color="btn btn-outline-success" onClick={() => this.edit(this.state.form)}>Edit</Button>
            <Button color="btn btn-outline-danger" onClick={this.closeModalEdit}>Cancel</Button>
          </ModalFooter>
        </Modal>
      </>
    );
  }
}

export default App;
