<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sample.aspx.cs" Inherits="E_Wallet.sample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 109px;
        }
        .auto-style2 {
            width: 343px;
        }
        .auto-style3 {
            width: 109px;
            height: 30px;
        }
        .auto-style4 {
            width: 343px;
            height: 30px;
        }
        .auto-style6 {
            width: 109px;
            height: 21px;
        }
        .auto-style7 {
            width: 343px;
            height: 21px;
        }
        .auto-style8 {
            width: 52px;
            height: 19px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">
                    <div class="row mt-3 justify-content-center">
                        <div class="form-group mx-sm-3 mb-2">
                            <input id="txtqty" class="auto-style8" type="number" value="1" />
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="auto-style6"></td>
                <td class="auto-style7">
                    </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style4">
                    



                    <select id="Category" name="D1">
                        <option value="MOV(Movement of Speed)">MOV(Movement of Speed)</option>
                        <option value="MGC(MAgic)">MGC(MAgic)</option>
                        <option value="JNG(Jungle)">JNG(Jungle)</option>
                        <option value="DEF(Defense)">DEF(Defense)</option>
                        <option value="ATK(Attack)">ATK(Attack)</option>
                    </select></tr>
           
        </table>
    </form>
</body>
</html>
