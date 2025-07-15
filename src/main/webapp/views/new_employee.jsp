<%@ include file="fragments/header.jsp" %>

<h3 class="mb-4">Add New Employee</h3>
<form action="/employee/saveEmployee" method="post">
    <div class="row mb-3">
        <div class="col">
            <label>Employee Code</label>
            <input type="text" name="employeeCode" class="form-control" required />
        </div>
        <div class="col">
            <label>Name</label>
            <input type="text" name="name" class="form-control" required />
        </div>
    </div>

    <div class="row mb-3">
        <div class="col">
            <label>Email</label>
            <input type="email" name="email" class="form-control" required />
        </div>
        <div class="col">
            <label>Phone Number</label>
            <input type="text" name="phoneNumber" class="form-control" required />
        </div>
    </div>

    <div class="row mb-3">
        <div class="col">
            <label>Designation</label>
            <input type="text" name="designation" class="form-control" />
        </div>
        <div class="col">
            <label>Department</label>
            <input type="text" name="department" class="form-control" />
        </div>
    </div>

    <div class="row mb-3">
        <div class="col">
            <label>Date of Joining</label>
            <input type="date" name="dateOfJoining" class="form-control" />
        </div>
        <div class="col">
            <label>Date of Birth</label>
            <input type="date" name="dateOfBirth" class="form-control" />
        </div>
    </div>

    <div class="row mb-3">
        <div class="col">
            <label>Gender</label>
            <select name="gender" class="form-select">
                <option value="">Select</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>
        </div>
        <div class="col">
            <label>Address</label>
            <input type="text" name="address" class="form-control" />
        </div>
    </div>

    <div class="row mb-3">
        <div class="col">
            <label>Profile Picture URL</label>
            <input type="text" name="profilePicture" class="form-control" />
        </div>
        <div class="col">
            <label>Username</label>
            <input type="text" name="username" class="form-control" />
        </div>
    </div>

    <div class="row mb-3">
        <div class="col">
            <label>Password</label>
            <input type="password" name="password" class="form-control" />
        </div>
        <div class="col">
            <label>Role</label>
            <input type="text" name="role" class="form-control" />
        </div>
        <div class="col">
            <label>Status</label>
            <input type="text" name="status" class="form-control" />
        </div>
    </div>

    <button type="submit" class="btn btn-success">Save</button>
    <a href="/employee/" class="btn btn-secondary">Cancel</a>
</form>

<%@ include file="fragments/footer.jsp" %>
