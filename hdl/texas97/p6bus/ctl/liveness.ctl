#verfiy the liveliness of p0 

AG((processor0.EU1.executionStage=FETCH)->AF(processor0.EU1.executionStage= EXECUTE));

AG((processor0.EU1.executionStage=EXECUTE)->AF(processor0.EU1.executionStage= FETCH));
