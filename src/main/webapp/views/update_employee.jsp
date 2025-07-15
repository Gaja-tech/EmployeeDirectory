<%@ include file="fragments/header.jsp" %>

<h3 class="mb-4">Update Employee</h3>
<form action="/employee/saveEmployee" method="post">
    <input type="hidden" name="id" value="${employee.id}" />
    
    <!-- All fields same as in new_employee.jsp -->
    <%-- Each field pre-filled with ${employee.fieldName} --%>

    <div class="row mb-3">
        <div class="col">
            <label>Employee Code</label>
            <input type="text" name="employeeCode" value="${employee.employeeCode}" class="form-control" required />
        </div>
        <div class="col">
            <label>Name</label>
            <input type="text" name="name" value="${employee.name}" class="form-control" required />
        </div>
    </div>

    <div class="row mb-3">
        <div class="col">
            <label>Email</label>
            <input type="email" name="email" value="${employee.email}" class="form-control" required />
        </div>
        <div class="col">
            <label>Phone Number</label>
            <input type="text" name="phoneNumber" value="${employee.phoneNumber}" class="form-control" required />
        </div>
    </div>

    <div class="row mb-3">
        <div class="col">
            <label>Designation</label>
            <input type="text" name="designation" value="${employee.designation}" class="form-control" />
        </div>
        <div class="col">
            <label>Department</label>
            <input type="text" name="department" value="${employee.department}" class="form-control" />
        </div>
    </div>

    <div class="row mb-3">
        <div class="col">
            <label>Date of Joining</label>
            <input type="date" name="dateOfJoining" value="${employee.dateOfJoining}" class="form-control" />
        </div>
        <div class="col">
            <label>Date of Birth</label>
            <input type="date" name="dateOfBirth" value="${employee.dateOfBirth}" class="form-control" />
        </div>
    </div>

    <div class="row mb-3">
        <div class="col">
            <label>Gender</label>
            <select name="gender" class="form-select">
                <option value="Male" ${employee.gender == 'Male' ? 'selected' : ''}>Male</option>
                <option value="Female" ${employee.gender == 'Female' ? 'selected' : ''}>Female</option>
                <option value="Other" ${employee.gender == 'Other' ? 'selected' : ''}>Other</option>
            </select>
        </div>
        <div class="col">
            <label>Address</label>
            <input type="text" name="address" value="${employee.address}" class="form-control" />
        </div>
    </div>

    <div class="row mb-3">
        <div class="col">
            <label>Profile Picture URL</label>
            <input type="text" name="profilePicture" value="${employee.profilePicture}" class="form-control" />
        </div>
        <div class="col">
            <label>Username</label>
            <input type="text" name="username" value="${employee.username}" class="form-control" />
        </div>
    </div>

    <div class="row mb-3">
        <div class="col">
            <label>Password</label>
            <input type="password" name="password" value="${employee.password}" class="form-control" />
        </div>
        <div class="col">
            <label>Role</label>
            <input type="text" name="role" value="${employee.role}" class="form-control" />
        </div>
        <div class="col">
            <label>Status</label>
            <input type="text" name="status" value="${employee.status}" class="form-control" />
        </div>
    </div>

    <button type="submit" class="btn btn-primary">Update</button>
    <a href="/employee/" class="btn btn-secondary">Cancel</a>
</form>

<%@ include file="fragments/footer.jsp" %>
