
      <Modal isOpen={modalInsert}>
        <ModalHeader>Create Tournament</ModalHeader>
        <ModalBody>
          <FormGroup>
            <Label>Name</Label>
            <Input
              type="text"
              value={form.championship_name}
              onChange={(e) =>
                setForm((prevState) => ({
                  ...prevState,
                  championship_name: e.target.value,
                }))
              }
            />
          </FormGroup>
          <FormGroup>
            <Label>Category</Label>
            <Dropdown
              isOpen={dropdownOpen === "category"}
              toggle={() => toggleDropdown("category")}
            >
              <DropdownToggle caret>
                {form.category || "Select Category"}
              </DropdownToggle>
              <DropdownMenu>
                {categories.map((category, index) => (
                  <DropdownItem key={index} onClick={() => handleCategoryChange(category)}>
                    {category}
                  </DropdownItem>
                ))}
              </DropdownMenu>
            </Dropdown>
          </FormGroup>
          <FormGroup>
            <Label>Status</Label>
            <Dropdown
              isOpen={dropdownOpen === "status"}
              toggle={() => toggleDropdown("status")}
            >
              <DropdownToggle caret>
                {form.status || "Select Status"}
              </DropdownToggle>
              <DropdownMenu>
                {statuses.map((status, index) => (
                  <DropdownItem key={index} onClick={() => handleStatusChange(status)}>
                    {status}
                  </DropdownItem>
                ))}
              </DropdownMenu>
            </Dropdown>
          </FormGroup>
          <FormGroup>
            <Label>Start and End Dates</Label>
            <RangePicker
              onChange={handleDateChange}
              value={[
                form.start_date ? moment(form.start_date) : null,
                form.end_date ? moment(form.end_date) : null,
              ]}
            />
          </FormGroup>
          <FormGroup>
            <Label>Inscription Dates</Label>
            <RangePicker
              onChange={handleInscriptionsChange}
              value={[
                form.start_inscriptions
                  ? moment(form.start_inscriptions)
                  : null,
                form.end_inscriptions ? moment(form.end_inscriptions) : null,
              ]}
            />
          </FormGroup>
          <TeamSelection
            teams={teamsData}
            selectedTeams={selectedTeams}
            setSelectedTeams={setSelectedTeams}
          />
        </ModalBody>
        <ModalFooter>
          <Button color="success" onClick={handleInsert}>
            Save
          </Button>
          <Button color="danger" onClick={() => setModalInsert(false)}>
            Cancel
          </Button>
        </ModalFooter>
      </Modal>
   