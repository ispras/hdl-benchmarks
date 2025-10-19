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
     n70 , n71 , n72 , n73 ;
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
buf ( n12 , n44 );
buf ( n13 , n57 );
buf ( n14 , n73 );
buf ( n15 , n50 );
buf ( n16 , n61 );
buf ( n17 , n68 );
xor ( n20 , n2 , n6 );
not ( n21 , n20 );
nand ( n22 , n4 , n8 );
nand ( n23 , n3 , n7 );
and ( n24 , n22 , n23 );
nor ( n25 , n3 , n7 );
nor ( n26 , n24 , n25 );
not ( n27 , n26 );
or ( n28 , n21 , n27 );
and ( n29 , n22 , n23 );
nor ( n30 , n29 , n25 );
or ( n31 , n20 , n30 );
nand ( n32 , n28 , n31 );
not ( n33 , n9 );
and ( n34 , n10 , n33 );
not ( n35 , n10 );
and ( n36 , n35 , n9 );
nor ( n37 , n34 , n36 );
not ( n38 , n37 );
not ( n39 , n38 );
or ( n40 , n32 , n39 );
not ( n41 , n37 );
not ( n42 , n2 );
or ( n43 , n41 , n42 );
nand ( n44 , n40 , n43 );
or ( n45 , n32 , n41 );
not ( n46 , n37 );
not ( n47 , n46 );
not ( n48 , n6 );
or ( n49 , n47 , n48 );
nand ( n50 , n45 , n49 );
xor ( n51 , n3 , n7 );
nand ( n52 , n4 , n8 );
xor ( n53 , n51 , n52 );
or ( n54 , n39 , n53 );
not ( n55 , n3 );
or ( n56 , n41 , n55 );
nand ( n57 , n54 , n56 );
or ( n58 , n53 , n41 );
not ( n59 , n7 );
or ( n60 , n47 , n59 );
nand ( n61 , n58 , n60 );
not ( n62 , n8 );
not ( n63 , n46 );
or ( n64 , n62 , n63 );
or ( n65 , n4 , n8 );
nand ( n66 , n65 , n22 );
or ( n67 , n38 , n66 );
nand ( n68 , n64 , n67 );
not ( n69 , n37 );
not ( n70 , n4 );
or ( n71 , n69 , n70 );
or ( n72 , n66 , n37 );
nand ( n73 , n71 , n72 );
endmodule
