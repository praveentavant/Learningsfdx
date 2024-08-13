public with sharing class PizzaBill {
    final Integer ONLY_ONE_SLICE = 8;
    final Integer UPTO_THREE_SLICE = 7;
    final Integer MORE_THAN_THREE_SLICES = 6;
    // this menthod returns the bill amount.
    public Integer GetBill(Integer numberofSlices) {
        Integer billAmount = numberofSlices==1 ? ONLY_ONE_SLICE*numberofSlices : (numberofSlices<=3 ? UPTO_THREE_SLICE*numberofSlices : MORE_THAN_THREE_SLICES*numberofSlices);
        return billAmount;

    }
}