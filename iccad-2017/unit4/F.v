module top ( g0 , g1 , g2 , g3 , g4 , g5 , g6 , g7 , g8 , g9 , g10 , g11 , g12 , g13 , g14 , g15 , g16 );
input g0 , g1 , g2 , g3 , g4 , g5 , g6 , g7 , g8 , g9 , g10 ;
output g11 , g12 , g13 , g14 , g15 , g16 ;
wire n1 , n2 , n3 , n4 , n5 , n6 , n7 , n8 , n9 , 
     n10 , n11 , n12 , n13 , n14 , n15 , n16 , n17 , n18 , n19 , 
     n20 , n21 , n22 , n23 , n24 , n25 , n26 , n27 , n28 , n29 , 
     n30 , n31 , n32 , n33 , n34 , n35 , n36 , n37 , n38 , n39 , 
     n40 , n41 , n42 , n43 , n44 , n45 , n46 , n47 , n48 , n49 , 
     n50 , n51 , n52 , n53 , n54 , n55 , n56 , n57 , n58 , n59 , 
     n60 , n61 , n62 , n63 , n64 , n65 , n66 , n67 , n68 , n69 , 
     n70 ;
wire t_0 ;
buf ( n1  , g0 );
buf ( n2  , g1 );
buf ( n3  , g2 );
buf ( n4  , g3 );
buf ( n5  , g4 );
buf ( n6  , g5 );
buf ( n7  , g6 );
buf ( n8  , g7 );
buf ( n9 , g8 );
buf ( n10 , g9 );
buf ( n11 , g10 );
buf ( g11 , n12  );
buf ( g12 , n13  );
buf ( g13 , n14  );
buf ( g14 , n15  );
buf ( g15 , n16  );
buf ( g16 , n17  );
buf ( n12 , n40 );
buf ( n13 , n65 );
buf ( n14 , n70 );
buf ( n15 , n44 );
buf ( n16 , n54 );
buf ( n17 , n60 );
xnor ( n20 , n9 , n10 );
not ( n21 , n3 );
not ( n22 , n7 );
or ( n23 , n21 , n22 );
nor ( n24 , n3 , n7 );
not ( n25 , n24 );
nand ( n26 , n4 , n8 );
not ( n27 , n26 );
nand ( n28 , n25 , n27 );
nand ( n29 , n23 , n28 );
not ( n30 , n2 );
and ( n31 , n6 , n30 );
not ( n32 , n6 );
and ( n33 , n32 , n2 );
nor ( n34 , n31 , n33 );
and ( n35 , n29 , n34 );
nor ( n36 , n35 , t_0 );
or ( n37 , n20 , n36 );
not ( n38 , n20 );
or ( n39 , n30 , n38 );
nand ( n40 , n37 , n39 );
or ( n41 , n38 , n36 );
not ( n42 , n6 );
or ( n43 , n42 , n20 );
nand ( n44 , n41 , n43 );
not ( n45 , n7 );
not ( n46 , n38 );
or ( n47 , n45 , n46 );
xor ( n48 , n3 , n7 );
and ( n49 , n48 , n26 );
not ( n50 , n48 );
and ( n51 , n50 , n27 );
nor ( n52 , n49 , n51 );
or ( n53 , n52 , n38 );
nand ( n54 , n47 , n53 );
not ( n55 , n8 );
not ( n56 , n38 );
or ( n57 , n55 , n56 );
xnor ( n58 , n4 , n8 );
or ( n59 , n58 , n38 );
nand ( n60 , n57 , n59 );
not ( n61 , n3 );
not ( n62 , n20 );
or ( n63 , n61 , n62 );
or ( n64 , n20 , n52 );
nand ( n65 , n63 , n64 );
not ( n66 , n4 );
not ( n67 , n20 );
or ( n68 , n66 , n67 );
or ( n69 , n58 , n20 );
nand ( n70 , n68 , n69 );
endmodule
