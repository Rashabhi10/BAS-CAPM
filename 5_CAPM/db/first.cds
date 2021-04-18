namespace rv.db;

// using {
//     cuid,
//     Currency
// } from '@sap/cds/common';

context airline {
    entity scarr {
            //key node_key : UUID;
        key carrid   : String(3);
            carrname : String(35);
            CURRCODE : String(3);
            url      : String(50);
            spfli    : Association to many spfli
                           on spfli.carrid = carrid;
    }

    entity spfli {
            //key node_key : UUID;
        key carrid    : String(3);
        key connid    : String(4);
            countryfr : String(3);
            cityfrom  : String(20);
            airpfrom  : String(3);
            countryto : String(3);
            cityto    : String(20);
            airpto    : String(3);
            fltime    : Date;
            deptime   : Time;
            arrtime   : Time;
            distance  : Decimal(9, 4);
            distid    : String(3);
            fltype    : String(1);
            period    : String(3);
            sflight   : Association to many sflight
                            on  sflight.carrid = carrid
                            and sflight.connid = connid;

    }

    entity sflight {
            //key node_key : UUID;
        key carrid     : String(3);
        key connid     : String(4);
        key fldate     : Date;
            price      : Decimal(15, 2);
            currency   : String(3);
            planetype  : String(10);
            seatsmax   : Integer;
            seatsocc   : Integer;
            paymentsum : Decimal(17, 2);
            seatsmax_b : String(10);
            seatsocc_b : String(10);
            seatsmax_f : String(10);
            seatsocc_f : String(10);

    }
}
