***Settings***

Library     SeleniumLibrary

Library     libs/db.py

Resource    kws.robot
Resource    hooks.robot

Resource    components/Sidebar.robot
Resource    components/Toaster.robot
Resource    pages/LoginPage.robot
Resource    pages/CustomersPage.robot
Resource    pages/EquiposPage.robot
Resource    components/TextoAlertas.robot


***Variables***
${base_url}     http://zepalheta-web:3000/ 
${admin_user}   admin@zepalheta.com.br
${admin_pass}   pwd123