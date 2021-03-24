<%-- 
    Document   : home
    Created on : Mar 7, 2021, 10:51:49 PM
    Author     : eon_A
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAABd1BMVEX///8AAAD/AAB7e3v8zp51dXXBwcF9fX1ubm7e3t7ExMSGhoZxcXF4eHhsbGz/+vr/39//i4v/5ub/xcX/zs7/urr/pKTv7+//9fX/cnL5+fn/1qT/srL/fX3/7u4eHh7/1tb/kZH/pqaZmZn/GBj/TU2Ojo5eXl7w8PD/W1v/Y2P/mZn/4uL/hITT09Pm5uY9PT2xsbH/ODj/t7f/QED/SEj/a2u1tbX/Kir/YGBUVFT/IyM0NDSjo6OVlZX/VFQSEhJGRkavl3TMroX/3qqSf2F+blT/gWPty5wXGRvnAQHEAAC9AQFOAQGwAQAwAAApKSlSRDTBonwzJx5jUD1/dVravJBMPzEjGxV1X0kyLySeiGglJx3/u4/nsomsnXlXWEQLHBX/mnc9STlweV73pH//eFu2k3GCdVoaMCaSj2/ZlnT/kG/OeV6obVT/ZE3/WURtYlK6r6P71rL+7dz+yI/YwKBdAwKZAAB2AwKGAwIRAAAhAQFGmXZRAAAUMElEQVR4nO1d6X/iRpq2sAEDBiR0cAmQMNiAOGzAGLcPfHbc7STT7e5xp9vpZKYnmc1me3eSTbLTc/zxW1USQhISKoEQJj8/n2wQUj2qquc96lVpZeURj3jEIx7xiEc8wgHyCZJhaJrn2MQCW5Gop1w5T5xmeU5s5NLpXnWv71NQ6lEsE3flAlM0Kc8Wizydd+FUiU6u7dOjPxCLwsJ6LpVnuVyOYkk3ziUUa4daaqW9NBiU7oyLadqTYKWDdjddJN0YOXla7Gq4tWsUz6QWNSRXUiQrHpR8vgNOcOX+knyupHIr5zi67sZZp0NcYKkabMdApN0ZPIx0oBESd+7YJMTzCQu1SDGdhtyWdoN15x7n2QYamIfdBsd40G15ge0wwji/eJ7mc1VF1NJFwZW5ESeLNTAw2wcST7ohwHZIMEWpyI8JRjxBF9N7ygw5rEqMO23J01QbiGSRznsikiRL5RpF4/CPk7SUHlmlAcW6dKOFopijOh6Z7TjDpfsHY4Ih0GJvJGy+wxwvuHXFPEO7di4bJFix6ivlOrrZDWWyp3MlatLCfKTpkRL4NNCvGqcVjBTDN6olHbk9kV6kfzsdErRUPURtV+dUPM8Uc2Wdn+TzdXN8fdm6LkXyVBtp/ajtdUbKtfX9BmxurcgszAmcEqDj0ohHjWOUj6BM9n1jGIiuRAZeQug0BvKwo5S2C6xWJkd/9RsdNyID7wCcEK7XHvogsO1xoUMdaPqt1AWOewMZg55LzrNXgDNuIHdOqcoBrQfaSQ20Y7Lb41CPcmBcSss1LhPAgA+9kHKDzteFItXVyuThgcgOkwx0g08sk14CUz1QB2CO52muoQ0mYcjFL6HtRkgB13iUqCn3GiK1p+N2mJaY5TPdCKl6h6rqyejNW78qsq6kFxYA4IiktaPQaLfBNCyaxHnLAZIVB1r16KZ5KW1UyiXtuBTwIHWeSE+k6yvxohrE1dxJ6C0EdVqsabkNqI6AvmDLcsc1+KXzJlXkO2mNNpa6DU6dYEwPuizSIhNvsyLFUKM8wtAVUSBItQbv0hrBgkByQxver0ms0f/IL5VDMo4Uq8jjAcUKi26M+2CoQ1k8lsvlxwTJlX2l5XWzEPKMlSNV58W02FncQpIrIIuclYdP0i7lkxcHoB45drkFcBIEqV/mf7f0Up2er88t9/SyRpwR276StMzSOAkJHq4nNoRFt2M+SNENGOmkGftDlxHQbkOXi/b6winScro3A1v+7Z1C4cVZLLoZCM1yEcWl3PNaOvMsZ5VOC20+IYzYPp6GJdAVOXvSlry13gk+VxMF8+9aWy/G6Mk42kw6vIoShh+KnuYSyGIN3FGrKDg83ntaxJqYV4nT1DCDkhNcajkOGAnEkN2i5YBpnk3kB/EEY7COQlVfzzttydMNGP8PeGtXIrltyw/Cn5l0HTVUhTnKjus0zBGv82mUUKyxkzylXSx+EAGrC6EsSjvH87DwxXqouIqUwCl57jQ9UawzeB2odKPJCUiuV1Zyr5KvL3qS7oJ1NsPZbudJhE4dECSIFwZVJVm+M6zmEdqeaIu2dq9h7yiFHfGDsBQclnWViCkY7kCd7IeigPGLgGOCBIFrN1wGGJjlUT64LeFZ2mkILoIiUEzFyLbLNYrjsQt4nA9RGbM4q06RZ8S9Un/QE3mWyTstBA5NSZAgKvNhM44Ey85QQJBxpqJaHLlIYo6Y7IhORnTRjcfB8QwErb2bB4TkTAQJYqKP+iDgxFczQ3DRBOwwraEYobVoCjbYmZnh9qIpTMbsXfjQO3EWSzHE+qJJTML03owWpp5NJRT2mo0ZIq4wPDaeNnQcg37SIhgZ4QpBYkd3ztaJ4gWa5QG8RtMdhlqtCY3s61jXLgBbLjHcHZ5Ql6x7CPPwyCWGQ5Ood3E9C60mwCWCRAGdLWMwPQsmB+HWNCQImHhrGT57CL4OfgbYDgET0xpxqZGz/Ngdawixa+I77GO3Y9KRgZOtGRiuu8Ywkhn/DDdNlYmcTEjarQY2ItOHoLPHFUNsnBGxk0C42WyGd4PK6iNmuyrBjaZ1LiQZbG1Eo85WLTUouMaQiDQ1Vj95XDA6OpZo+aOx5IalYQkFV/yr0Y1pwxf3CO7AfnsR21Vbsn+KJ6Wh9dVV/4rfkkFyfWXXv7q6PmXy2T2G28NkyM6x0h0ZrDY1Y4BgYCVm7RysV1bATVhdn85BcpPhSJgdDKkAbLx/pbVhfcjuProNq+tTJfXcm4dwSJ6o/01eI9a0HhKMhSALS1Ri4LgNSHEaR949LY3B0wVH/2OZ6WPY8I39lczEKRvYHB656ZzhhmsMZf9F45du23fjiR/2DLgXW5PnGPx6Hw1n57bfTZ8GQmv2n9kY/EwEEowFoNdi00x/U5ak1ahj2++eX6r0QtjkM3NUgtFV2QiE7f3XKLgPwPADilGHEZk2tnh5fwtwfvX21WQur/94f3txd3d3cf5S8+nQ6dAl0CeoH7DzoL1+8LN9HAd9C6hMJgg73antH7Xm4nJNRvby8u726o0Jt6+ent+Bb7PKgWuXt+pXheEJ9f63ZS+G0LSCY24TTz524X2QJ64z26+K6ZshwSHN7N39y69G5N5cXVyPuA0pqgfE1DNu41BEkwpJYxA3AAlDC3SMrIsj26/mad5m14ztX7vMXl/fQVxfZ7Nj34LjL98Nfz4yDrqgOmg+pJCdhyJa8eN3SGgdnCyAbD9+WKZpz+vLu6vryzEWlshmb++zWbUPNUxG68lBi4hgd+iFtdadTKrK+lBSN5zYfrU5l9l74t09Hsns5cVTgsiuXQ9/rA0jVm34ydZ7HdiSpnVEYY5gQJEoJ7ZfHaZ3a9n7rwni3fn1+Hg09B6kR7y+Xls7H/5Ye0/3ZX6Wjd/yOxFRPU6GkurA9qvadwWIvf/m2z8B0ZlAUqb39Y8X78E/l6rgVgxntOw/YOejiogeT+Nm7kNmUFKjQWzbrzpagFX2/cfPvr/47s+QpMlwlen96dtvPnz2AerSxfCnusggM4GfbOfRGItMt/7fXFUkFT/uV72Qe9hx2fc+308fv/nxL2Mks5d3gN53t9//9dD3E/pm1IV6vZigHmgSQRHNRKctp2ptJGVJxY/7VZN4jYigYr/SXz/8x3fEy9vRaL3+gfjPH//ro1zo+AEdqc5C7LxoaGjOWrHpF1UzG1Ck0Jkw75JqMN4gPt+rBX+f/ffba7UH7//n49/UWjnUhaqQYi8By4EsbN9si1KRsDIacG2/6oU8vUTjFFXGldp/+/i9dpC+//DZT4cl1L/oTmS/Hv4MVxIDw9mzP0sCFOIYOgswNMG0/RW1M9BUXJMn2ZiLtqa4pLJ3k1Xd7lMH8bwsojMlsRH2YbwFJRXT9o9iqCsTBTXFiCDuEhq087KIurHmhhKsUFIxbf/IW35tY+4VftfqEMWtF4J2PoZE1J2CzaRfkVQ/1iTR1iaejw9PIy7PR4fj1SYiO49E1O/WmmImqEgqnu3XRnVf3cNIAgJEFiiqAH+Mogvgcr/THI3VYGjno0jkZ1iBGANM37SiUUzbr68bevXz1dXTl3Ks/+7qB/THq9f3tyCQOn+qq0XFGnJQ2aOrSTlr5iKgZMFsT9SP04w51nmHXBRRPcJQUuEMX58XRey8PVK8Lffr3kNQZqCkYtl+F5+30ALqHfJEI/OofktGkrIrgWX7W85y/EdYIgPtPAznk9YB40zIRBRJ3cCZAo6ee1rFagCy87ANszpq1thUvFQ824+fIcZzTIAKIC0PzLM6Ci7rwMAf0/bHsPjhOTJQyWURdZIcc44w7L2TDXvbn2k1m82WzTOyELFWpgkPtblwJaoMnUl1CK4gBOcAmPETbH8mEFGJ2T5dUlBj5tPtE+vRCucGVLj5iKgelQjQsfC6Zc4/PFO1vkVSN6RYqaSbjpo1tgC1UMw8578780LwkUlSCdl5IKIhu5Uzt3DclIfNmO0P2/A7PSVevTp9ZjN0z4zGP7AuL4SFvSsx3d+Xtc1g++2LonaOrq+P7FfD9V0FZr1/C4zOXS8fGWrCu7m5oYv7cbyYZzs//7yDcdyZZroBO49EdNPbJzBb8DaDmzuy/Xi1l0cAOMedqkq9JQ+VzInXz2FUtuDEiMk5/0oI19U+3dmRZ+FupjV53b+1EsoocwGK6MkCHvnabCEvFdj+yosY9pMWL+QuRBo1mWLmbCeTAcEuDNdC7ka7uICSmoRLxTtPjAW9E4C6UE7I2PyqcnYGV6/BWGm6He3iIhBYOfYHV3cK4ZWnhtYdRY73w4HdTQvzf4Z+j55VPPJv7gbC+5tR4x4v5yv7L3ZWg/7dlf3Flek3tzYAwaNnxLfajBlROFZ1wmogItnYV/9CaGmfZvjqOntOPDsCFDdOvHzG24hkMAoIvru/WMveqY3TWJCKkZnax8mh+mpXHTIqR7jscXH17tnOzmpksY8hJF8Agig1mL2W84I72gadmPNDHIdmUefBK9tpvFVS/oXC0dFin5ut7DyJEu+ygN75D9nLt4S2UmRFX7dlCUPADj2e+8vs03NI8R0R2TlbKMVtcIdPzrNr5/cE8TJ7ea8niBnlG855RFxksy+J19lrMFA3wSiJrSwQITAkf0XJ6zeF03fXl039/bbaAksPg62rNOGAP7+Fp/0N/J9cpNAgpOTlh1vimbH0DPMhmlPjGf8XfIbWrX751SMOdkAUr++JguEJuqA9OwSDS31CPJNXrX77xUMSE/HrL6gXTwsF/ZMtuM+y6dNax0Th2VPUhQ9pN1I4E6+IQkH30ACWkkLoF9XO4J26zc4wROv0HDaI//W3/wMEC7rULvnl3zEp6vQpdgpP9Mt0PRgnuYblRsKzIS7HT1rzzfh8vptPdiz//unGp9sqBvnj00S7KUbqljF3QZoOrciWzj9hlHqS5zef/vGFCbcv/vHp5jk6Qr8ZTnJrC7dCSUUebmba5jze67lC/PNmtMeU7/nzm5vPv4T4/OZGoSbjZraG1Xm4K195wuZ/cwP0Mb/45+daMkY8//zTF8Sfp75CnOFq9pv/zQ1h7Xj88ub58xFV8PfNl6OxO5XXkqfFPWXzvwXtAm2yDvyvf/8B4t//Mn7hlCLJD9+Wkpu8t+E84Wyh20EiTeDU16VgbP43Pzh9sBsrRErRo3dJlURhvgwsmjAcMg5SUzJsi4USHc0LBXE3/3MJ8XyCZIsSRVGs+uJN5ws0EzYySwncgeZFgmVvNmDPkyTNS2K63IfX7veKujcr4C3+6mG+KqFsdevrV3tUsUMnUvPXTZrSvza0b/Iu2+kqhsamosBR6XSjSHv4PhHNjsVoNjTMX9SLHVToYSzI8OZ9y5rrdXTvHqN467mOG/kascB0RWq4EzpEmbJ5le24jm6bLRkWzoyfPPGKjwFkUR2aVWrsvU8m8BtbHoXP7BhJB0x2BltAJ442065SuBu0ju2cqNiB5klMTveexjaVhQhjmmPCY+ZzASPKJrbq7PXRxr2U9A9Q6ARzTJI8TP4minDX7lJVcv5ubEMdQmHSsUbfzqNVtDwcmqUBN90+tMZGT85HRPUHe6E18JVkoOemN0WG9TSbPQKNi1NzXmciuV5vFnIIhkFql3Ex3JA5roXmad6V934blNR2m0eD8Zzfen3eLdfPUJNhnxU80x3/EHb0ssGmnqHTHyzBftd6nxRj6c+gvfNv4YzI6OUfo9ROM3GPIoGWsx0APEclCCZeKHyi1pichO2BDnwR3AVTdtcPbtDRgl6SgAM4pWJBtFbWCp88KYD//LYIFoLHIcVbC+2j+s35leLPCNRz27GR+5zc3w6u2iCofYg3fCwXb+A9nDBPBCLBMUTkGDDYamUqyWSyhYDBcOfJk+3t2Lo/Ck6xtaUEkrHx8we3PCxORJsQGWGefMLow20dYjJMjozGpt4rzzH8pk2NmMGW4apJbwGYHen3rn7PrAs9QNS7Mu9N006cO6bdC3AKZCKx9TG4xTo6fmoZMU+LTFuhMYTdoRjdMjk3wsJ3Sq64MzujiyoHxsCxK53ooUlwjk0MH80GGxsLL9ObiFY4MCOaiy2XfcQjHvEIR/BgNXxRyNOdIk0L+YdUfusOUgJbzFGiSHtah+IB4imyU0xXB92cxHjyulnPEM/XWa5R7vt83RwneFes4QHyJM1RA1TvMmjwwhIKSoqhBTOVSAk016gppVEHDVbwumGzg2SLjTRFsYYRFxfoYq6n1ijVxKXjlkrQPHXQ9fnKunKBONLGg+E7pH2+fk1iyaUak/kEXZRqe2jYDSR16TKeh305GJXvACkB3BJLxC1FMkWx1x4OO3VFPUGyEjXol3xabj1umbiRDE+l25r2HyByQEGkRlVHDJbMpTnnVSCLAgnmWbqra//hgUgLoC9VbdRyA6Z7ObhBBRFr5TEGhwMgmOm9sc99pW6DWwpuioIcjlOwRKmc0xfgPkzk9QqCiWqOZ5y+99tzAGZ6BdFjL93gGZoa5wY+fuAyCRSkYVAQDbo5qgiiNHRkPa37qkrxpn7ZA0Ec+SAmCoLQ76YljiZ1ekGrx/YHIk8+3PkGFUQ8MFeQdrknFem6SWF2nEP2oF2VHi63CQrSr6YlniatlaKe8x3WpM6DdScFoCB9E2Klalrs0KT9VGI7wvxbaYoU6Bd6sgFK8LUxYoOGyDMPLOTMCwxN0yzPiY1cOt2rdmUnqdboTCpDjMMnTlVe/UFD4oUHOIniZLFndPoOy5RtSoOUkENV6g5yHM8kHh4xhDwtGdR8D4QhddvWksV0eZDmQAc/ZDejzje06nB4AFwHzOxoXYg/YGIImqcrgVORln5XyVHN05WlGsUvgafuAPE6n0b2+LCbk3DM1FIhxSBNaVdFXvhddRtCvZMrAZEsLlOuBh+0lEs//PhqWiQYfunSvo94xCMm4f8B1yhGGwqTILMAAAAASUVORK5CYII=" type="image/png">

        <title>JSP Page</title>


        <style>
            ul{
                display: flex;
                flex-direction: row;
                flex-wrap: wrap;

                list-style: none;
            }

            li{
                margin: 10px;
            }


        </style>
        <script
            src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous"></script>
    </head>
    <body>
        <h1>COLLECTION</h1>
        <h2>ΡΟΥΧΑ!!!! ΣΕ ΚΟΥΤΑΚΙΑ!!!</h2>
        <div>
            <h2>General Section</h2>
            <a href="${pageContext.request.contextPath}/">Home Page</a>
            <a href="${pageContext.request.contextPath}/collection">Collection</a>
            <a href="${pageContext.request.contextPath}/offers">Προσφορές</a>
            <a href="${pageContext.request.contextPath}/about">About</a>
            <a href="${pageContext.request.contextPath}/contact">Contact</a>
            <a href="${pageContext.request.contextPath}/loginpage">Login</a>
        </div>

        <div>
            
                
                    <h4>Brands</h4>
                    <c:forEach items="${brands}" var="brand">
                        <input type="checkbox" name="brand" value="${brand.brandname}" id="${brand.brandname}">${brand.brandname}
                    </c:forEach>
                    
                <li>

                    <h4>Categories</h4>
                    <c:forEach items="${categories}" var="category">
                        <input type="checkbox" name="category" value="${category.categoryname}" id="${category.categoryname} ">${category.categoryname} 
                    </c:forEach>
                </li> 
                <li>
                    <h4>Gender</h4>
                    <c:forEach items="${genders}" var="gender">
                        <input type="checkbox" name="gender" value="${gender.gendername}" id="${gender.gendername}">${gender.gendername}
                    </c:forEach>
                </li>
                <li>
                    <h4>Sizes</h4>
                    <c:forEach items="${sizes}" var="size">
                        <input type="checkbox" name="size"  value="${size.sizename}" id="${size.sizename}">${size.sizename}
                    </c:forEach>
                </li> 
                <li>
                    <h4>Colors</h4>
                    <c:forEach items="${colors}" var="color">
                        <input type="checkbox" name="color"  value="${color.colorname}" id="${color.colorname}">${color.colorname}
                    </c:forEach>
                </li>     

            
            
            <!--Έβαλα ένα hidden "select" πεδίο "All" και έδωσα ακόμα μία class all σε όλα τα products ώστε όταν δεν έχει φίλτρα να τα εμφανίζει πάλι όλα--> 
            <select id="genre" hidden>
                <option value="all">All</option>
            </select>


        </div>

        <div>
            <ul>
                <c:forEach items="${products}" var="product">
                    <li>
                        <div id="${product.title}" class="category ${product.brand.brandname} ${product.category.categoryname} ${product.gender.gendername} ${product.size.sizename} ${product.color.colorname} all">
                            <img src="${pageContext.request.contextPath}/images/${product.image}"></img>
                            <h4>${product.title}</h4>
                            <div></div>
                            <p>${product.price} €</p>       
                        </div>
                    </li>
                </c:forEach> 

                <%--   <c:forEach items="${listOfProducts}" var="product">
                       <li>
                           <div>
                               <img src="${pageContext.request.contextPath}/images/${product.image}"></img>
                               <h4>${product.title}</h4>
                               <div></div>
                               <p>${product.price}</p>
                           </div>
                       </li>
                   </c:forEach> --%>

            </ul>
        </div>


        <form:form action="${pageContext.request.contextPath}/logout" method="POST">
            <input type="submit" value="Logout">            
        </form:form>




        <script>
            $(document).ready(function () {
                $(':input').change(function (evt) {
                    var filter = $(':input:checked,select').map(function (index, el) {
                        return "." + el.value;
                    }).toArray().join("");
                    $(".category").hide().filter(filter).show();
                });
            });
        </script>

    </body>
</html>
