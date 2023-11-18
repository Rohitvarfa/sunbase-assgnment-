<%@ page import="com.ex.model.Customer" %>
<%@ page import="com.ex.service.ApiService" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Success</title>
</head>
<style>
    .userList {
        align-content: center;
        border: 1px solid black;
        border-collapse: collapse;
        width: 60%;
        margin-left: 20%;
        margin-top: 5%;
    }

    .row {
        background-color: #072588;
        color: white;
    }

    .userList td, .userList th {
        border: 1px solid black;
        padding: 8px;
        text-align: center;
    }


    .userList tr:nth-child(even) {
        background-color: #5b5050;
    }

    .btn {
        background-color: #105a96;
        border: none;
        color: white;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin-left: 20px;
        cursor: pointer;
    }
</style>
<body>

<%
    ApiService apiService = new ApiService();
    List<Customer> userList = apiService.getCustomerList(session);
%>

<button class="addUser btn" onclick="location.href='addCustomer'">Add User</button>
<button class="logout btn" onclick="location.href='logout'">Logout</button>
<section>
    <div class="msg">
        <%
            if (request.getAttribute("msg") != null) {
                out.print(request.getAttribute("msg"));
            }
        %>
    </div>
    <table class="userList">
        <tr class="row">
            <th> First Name</th>
            <th> Last Name</th>
            <th> Address</th>
            <th> City</th>
            <th> State</th>
            <th> Phone</th>
            <th colspan="2"> action</th>
        </tr>
        <%

            for (Customer user : userList) {
//                System.out.println(user);

        %>
        <tr>
            <td><%= user.getFirst_name() %>
            </td>
            <td><%= user.getLast_name() %>
            </td>
            <td><%= user.getAddress() %>
            </td>

            <td><%= user.getCity() %>
            </td>
            <td><%= user.getState() %>
            </td>
            <td><%= user.getPhone()%>
            </td>


            <td>
                <a href="deleteCustomer?uuid= <%= user.getUuid()%> ">Delete</a></td>
            <td><a href="updateCustomer?uuid=<%= user.getUuid()%>
            &first_name=<%= user.getFirst_name()%>
            &last_name=<%= user.getLast_name()%>
            &street= <%= user.getStreet()%>
            &address=<%= user.getAddress()%>
            &city=<%= user.getCity()%>
            &state=<%= user.getState()%>
            &email=<%= user.getEmail()%>
            &phone=<%= user.getPhone()%>">Edit</a></td>
        </tr>
        <%
            }
        %>

    </table>
</section>
</body>
</html>
