package com.chengxusheji.po;

import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotEmpty;
import org.json.JSONException;
import org.json.JSONObject;

public class OrderInfo {
    /*订单id*/
    private Integer orderId;
    public Integer getOrderId(){
        return orderId;
    }
    public void setOrderId(Integer orderId){
        this.orderId = orderId;
    }

    /*订单商品*/
    private Product productName;
    public Product getProductName() {
        return productName;
    }
    public void setProductName(Product productName) {
        this.productName = productName;
    }

    /*订单数量*/
    @NotNull(message="必须输入订单数量")
    private Integer orderNumber;
    public Integer getOrderNumber() {
        return orderNumber;
    }
    public void setOrderNumber(Integer orderNumber) {
        this.orderNumber = orderNumber;
    }

    /*订单总金额*/
    @NotNull(message="必须输入订单总金额")
    private Float totalMoney;
    public Float getTotalMoney() {
        return totalMoney;
    }
    public void setTotalMoney(Float totalMoney) {
        this.totalMoney = totalMoney;
    }

    /*待冲印照片*/
    private String printFile;
    public String getPrintFile() {
        return printFile;
    }
    public void setPrintFile(String printFile) {
        this.printFile = printFile;
    }

    /*联系电话*/
    @NotEmpty(message="联系电话不能为空")
    private String telephone;
    public String getTelephone() {
        return telephone;
    }
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    /*订单状态*/
    private OrderState orderStateObj;
    public OrderState getOrderStateObj() {
        return orderStateObj;
    }
    public void setOrderStateObj(OrderState orderStateObj) {
        this.orderStateObj = orderStateObj;
    }

    /*订单备注*/
    private String orderMemo;
    public String getOrderMemo() {
        return orderMemo;
    }
    public void setOrderMemo(String orderMemo) {
        this.orderMemo = orderMemo;
    }

    /*下载地址*/
    private String handleFile;
    public String getHandleFile() {
        return handleFile;
    }
    public void setHandleFile(String handleFile) {
        this.handleFile = handleFile;
    }

    /*下单用户*/
    private UserInfo userObj;
    public UserInfo getUserObj() {
        return userObj;
    }
    public void setUserObj(UserInfo userObj) {
        this.userObj = userObj;
    }

    /*下单时间*/
    private String orderTime;
    public String getOrderTime() {
        return orderTime;
    }
    public void setOrderTime(String orderTime) {
        this.orderTime = orderTime;
    }

    public JSONObject getJsonObject() throws JSONException {
    	JSONObject jsonOrderInfo=new JSONObject(); 
		jsonOrderInfo.accumulate("orderId", this.getOrderId());
		jsonOrderInfo.accumulate("productName", this.getProductName().getProductName());
		jsonOrderInfo.accumulate("productNamePri", this.getProductName().getProductId());
		jsonOrderInfo.accumulate("orderNumber", this.getOrderNumber());
		jsonOrderInfo.accumulate("totalMoney", this.getTotalMoney());
		jsonOrderInfo.accumulate("printFile", this.getPrintFile());
		jsonOrderInfo.accumulate("telephone", this.getTelephone());
		jsonOrderInfo.accumulate("orderStateObj", this.getOrderStateObj().getStateName());
		jsonOrderInfo.accumulate("orderStateObjPri", this.getOrderStateObj().getStateId());
		jsonOrderInfo.accumulate("orderMemo", this.getOrderMemo());
		jsonOrderInfo.accumulate("handleFile", this.getHandleFile());
		jsonOrderInfo.accumulate("userObj", this.getUserObj().getName());
		jsonOrderInfo.accumulate("userObjPri", this.getUserObj().getUser_name());
		jsonOrderInfo.accumulate("orderTime", this.getOrderTime());
		return jsonOrderInfo;
    }}