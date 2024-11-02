import React, { Component } from "react";

class App extends Component {
  handleFileChange = (event) => {
    const file = event.target.files[0];
    if (file && file.size > 100 * 1024 * 1024) {
      alert("File size exceeds 100 MB");
      event.target.value = null;
    }
  };

  render() {
    return (
      <div className="mb-3">
        <label htmlFor="dni" className="form-label">DNI</label>
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
        />

        <label htmlFor="firstName" className="form-label">First Name</label>
        <input
          type="text"
          className="form-control"
          name="firstName"
          id="firstName"
          placeholder=""
          required
        />

        <label htmlFor="lastName" className="form-label">Last Name</label>
        <input
          type="text"
          className="form-control"
          name="lastName"
          id="lastName"
          placeholder=""
          required
        />

        <div className="mb-3">
          <label htmlFor="userType" className="form-label">Type of user</label>
          <select className="form-select" name="userType" id="userType" required>
            <option value="">Select one</option>
            <option value="Technical Director">Technical Director</option>
            <option value="Referee">Referee</option>
            <option value="Player">Player</option>
          </select>
        </div>

        <div className="mb-3">
          <label htmlFor="formFile" className="form-label">Upload Image</label>
          <input className="form-control" type="file" id="formFile" accept="image/*" onChange={this.handleFileChange} />
        </div>

        <button type="submit" className="btn btn-outline-primary">Submit</button>
        {" "}
        <button type="button" className="btn btn-outline-secondary" onClick={() => window.history.back()}>Cancel</button>
      </div>
    );
  }
}

export default App;
