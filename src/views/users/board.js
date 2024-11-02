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
    {id: 1, firstname: "Alejandro", lastname: "Fernandez", dni: "29345789",typeofuser: "Technical director"},
    {id: 2, firstname: "Juan", lastname: "Perez", dni: "123456", typeofuser: "Technical director"},
    {id: 3, firstname: "Maria", lastname: "Rodriguez", dni: "10908345", typeofuser: "Referee"},
    {id: 4, firstname: "Carlos", lastname: "Lopez", dni: "45789321", typeofuser: "Player"},
    {id: 5, firstname: "Ana", lastname: "Martinez", dni: "34567890",typeofuser: "Referee"},
    {id: 6, firstname: "Luis", lastname: "Sanchez", dni: "78912345", typeofuser: "Coach"},
    {id: 7, firstname: "Sofia", lastname: "Diaz", dni: "98765432", typeofuser: "Referee"},
    {id: 8, firstname: "Miguel", lastname: "Torres", dni: "21345678",typeofuser: "Referee"},
    {id: 9, firstname: "Elena", lastname: "Gomez", dni: "65432198", typeofuser: "Player"},
    {id: 10, firstname: "Ricardo", lastname: "Ramirez", dni: "32178965", typeofuser: "Technical director"}
];

class App extends React.Component{
    state={
        data:data
    }
    render(){
        return(
            <>
            <Container>
                <br>
               </br>
            <Button color="btn btn-outline-primary">Create</Button>
            <Table>
                <thead><tr>
                    <th>Id</th>
                    <th>Firstname</th>
                    <th>Lastname</th>
                    <th>DNI</th>
                    <th>Type of User</th>
                    <th>Actions</th>Accion
                
                
                </tr></thead>
                <tbody>
                    {
                       this.state.data.map((element)=>(
                        <tr>
                            <td>{element.id}</td>
                            <td>{element.firstname}</td>
                            <td>{element.lastname}</td>
                            <td>{element.dni}</td>
                            <td>{element.typeofuser}</td>
                            <td>
                                <Button color="btn btn-outline-success">Edit</Button>
                                <Button color="btn btn-outline-danger">Delete</Button>
                            </td>
                        </tr>

                       ))
                    }
                </tbody>
            </Table>
            </Container>
            </>
        )

    }
}
export default App;