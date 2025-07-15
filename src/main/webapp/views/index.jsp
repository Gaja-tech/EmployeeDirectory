<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="fragments/header.jsp" %>

<div class="d-flex justify-content-between align-items-center mb-3">
    <h2>Employee Directory</h2>
    <form class="d-flex" action="/employee/search" method="get">
        <input type="text" name="keyword" class="form-control me-2" placeholder="Search by name..." required />
        <button class="btn btn-outline-primary" type="submit">Search</button>
    </form>
</div>

<div class="mb-3 text-end">
	<c:if test="${loggedInRole == 'admin'}">
	    <a href="${pageContext.request.contextPath}/employee/showNewEmployeeForm" class="btn btn-success mb-3">Add Employee</a>
	</c:if>
</div>

<c:if test="${empty listEmployees}">
    <div class="alert alert-warning text-center">No employees found.</div>
</c:if>

<c:if test="${not empty listEmployees}">
    <div class="table-responsive">
        <table class="table table-hover align-middle">
            <thead class="table-dark">
                <tr>
                    <th>#</th>
                    <th>Profile</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Designation</th>
                    <th>Department</th>
                    <th>Username</th>
                    <th>Role</th>
                    <th>Status</th>
					<c:if test="${loggedInRole == 'admin'}">
                      <th class="text-center">Actions</th>
					</c:if>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="employee" items="${listEmployees}" varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>
                        <td>
                            <img src="${employee.profilePicture}" alt="Profile" width="50" height="50"
                                 class="rounded-circle border" onerror="this.onerror=null;this.src='https://via.placeholder.com/50';" />
                        </td>
                        <td>${employee.name}</td>
                        <td>${employee.email}</td>
                        <td>${employee.phoneNumber}</td>
                        <td>${employee.designation}</td>
                        <td>${employee.department}</td>
                        <td>${employee.username}</td>
                        <td>${employee.role}</td>
                        <td>
                            <span class="badge bg-${employee.status eq 'Active' ? 'success' : 'secondary'}">
                                ${employee.status}
                            </span>
                        </td>
                        <td class="text-center">
							<c:if test="${loggedInRole == 'admin'}">
							    <a href="${pageContext.request.contextPath}/employee/showFormForUpdate/${employee.id}" class="btn btn-sm btn-primary">Edit</a>
							    <a href="${pageContext.request.contextPath}/employee/deleteEmployee/${employee.id}" class="btn btn-sm btn-danger"
							       onclick="return confirm('Are you sure?');">Delete</a>
							</c:if>

                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</c:if>

<%@ include file="fragments/footer.jsp" %>
