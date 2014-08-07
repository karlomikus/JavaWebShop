<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tpl" uri="/WEB-INF/tlds/shop_tld.tld" %>
<tpl:head_tag title="${product.category} ${product.name}" />
<tpl:navbar_tag />
    
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Product name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><a href="#"><i class="fa fa-times-circle"></i></a></td>
                        <td>DT770</td>
                        <td>2</td>
                        <td>$129.99</td>
                    </tr>
                    <tr>
                        <td><a href="#"><i class="fa fa-times-circle"></i></a></td>
                        <td>DT880</td>
                        <td>1</td>
                        <td>$229.99</td>
                    </tr>
                    <tr>
                        <td><a href="#"><i class="fa fa-times-circle"></i></a></td>
                        <td>DT990</td>
                        <td>1</td>
                        <td>$329.99</td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="2">Total:</td>
                        <td>4</td>
                        <td>$600</td>
                    </tr>
                </tfoot>
            </table>
            <div class="well">
                <a href="#" class="btn btn-success">Place order</a>
            </div>
        </div>
    </div>
</div>
    
<tpl:foot_tag />