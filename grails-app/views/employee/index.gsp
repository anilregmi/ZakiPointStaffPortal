<!doctype html>
<html lang="en">
<head>
    <meta name="layout" content="main" />
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Employee</title>
    <style>
    .search {
        background: #0F4C75;
        width: 1333px;
        padding: 18px 30px;
        border-radius: 15px;
        margin-right: 20px;
        margin-left: 20px;
        margin-top: 20px;
    }
    .employee {
        width: 300px;
        height: 30px;
        border-radius: 10px;
        border: none;
        margin-right: 20px;
        padding: 0px 22px;
    }

    .department {
        width: 300px;
        height: 30px;
        border-radius: 10px;
        border: none;
        padding: 0px 22px;
    }

    .search-form {
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .submit-btn {
        width: 155px;
        height: 35px;
        background: #8faef2;
        border-radius: 10px;
        border: none;
        margin-left: 36px;
    }

    .submit-btn:hover {
        background: #1B262C;
    }


    /*.back_btn{*/
    /*    height: 37px;*/
    /*    width: 37px;*/
    /*    position: relative;*/
    /*    left: 3.95%;*/
    /*    right: 93.34%;*/
    /*    top: 4.52%;*/
    /*    bottom: 77.42%;*/
    /*    background: #0F4C75;*/
    /*    border-radius: 10px;*/
    /*}*/
    .show_employee {
        color: #ffffff;
        width: 1258px;
        min-height: fit-content;
        position: absolute;
        border-radius: 15px;
        left: 4.55%;
        right: 3.44%;
        top: 35.13%;
        bottom: 2.23%;
        background: #0F4C75;
        border-radius: 15px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .a {
        display: flex;
        flex-direction: column;
    }

    .b1 {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
    }

    .b2 {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
    }

    .c {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        margin-bottom: 50px;
    }
    h1{
        font-size: 30px;
        font-weight: bold;
    }
    h2{
        font-size: 20px;
    }
    li{
        list-style: none;
    }

    </style>

</head>

<body>
<div class="search">
    <g:form action="search" class="search-form">
        <input type="text" name="employeeQuery" placeholder="Search employee..." class="employee" >
        <!-- Assuming you have access to the list of departments in the model -->
        <g:select name="departmentQuery" from="${zakiemployee.Department.list()}" optionKey="departmentName" optionValue="departmentName" noSelection="['':'Select Department...']" class="department" />
        <input type="submit" value="Search" class="submit-btn">
    </g:form>
</div>

%{--<div class="back_btn">--}%
%{--    <button id="myButton"><</button>--}%
%{--</div>--}%
<div class="show_employee">
    <div id="alertMessage" class="alert-message" style="display: ${noResults ? 'block' : 'none'};">
        <g:if test="${noResults}">
            ${alertMessage}
        </g:if>
    </div>
    <g:each var="employee" in="${employees}">
        <div class="a">
        <h1>${employee.firstName} ${employee.lastName}</h1>
        <li>${employee.designation}</li>
        </div>
        <div class="b">
        <div class="b1">
        <h2>Employee Details</h2>
        <li>Position:${employee.position}</li>
        <li>Gender:${employee.gender}</li>
        <li>Team:${employee.team?.teamName}</li>%{--Accessing teamName through the relationship--}%
        <li>Department: ${employee.department?.departmentName}</li>%{--Accessing departmentName through the relationship--}%
        </div>
        <div class="b2">
            <h2>Contact Details</h2>
            <li>Phone:${employee.contact}</li>
        </div>
        </div>
        <div class="c">
        <g:if test="${employee.position == 'Lead' && employee.team}">
            <h2>Other team members:</h2>
            <g:each var="teamMember" in="${employee.team.employee}">
                <g:if test="${teamMember.position != 'Lead'}">
                    <li>Name:${teamMember.firstName} ${teamMember.lastName}</li>
                    <li>Designation:${teamMember.designation}</li>
                </g:if>
            </g:each>
        </g:if>
        </div>
    </g:each>

</div>
</body>
</html>