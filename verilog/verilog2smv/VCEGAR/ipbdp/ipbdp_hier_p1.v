/*
 *
 * Taken from VCEGAR benchmarks -- http://www.cprover.org/hardware/benchmarks/vcegar-benchmarks.tgz
 * Modified by Ahmed Irfan <irfan@fbk.eu>
 *
 */ 

module IPBDP_hier ( P_0 , P_1 , P_2 , P_3 , P_4 , P_5 , P_6 , P_7 , P_8 , P_9 , P_10
 , P_11 , P_12 , P_13 , P_14 , P_15 , P_16 , P_17 ) ;
 output  [15:0]  P_0 ;
 output  [15:0]  P_1 ;
 input  [15:0]  P_2 ;
 input  [15:0]  P_3 ;
 input  signed  [15:0]  P_4 ;
 input  [15:0]  P_5 ;
 input  P_6 ;
 input  [15:0]  P_7 ;
 input  [15:0]  P_8 ;
 input  [15:0]  P_9 ;
 input  [15:0]  P_10 ;
 input  signed  [15:0]  P_11 ;
 input  [15:0]  P_12 ;
 input  [15:0]  P_13 ;
 input  [15:0]  P_14 ;
 input  [15:0]  P_15 ;
 input  signed  [15:0]  P_16 ;
 input  [15:0]  P_17 ;
 wire  [1:0] E_291529983035 ;
 wire  [1:0] E_291829973034 ;
 wire  [0:15] E_293329963033 ;
 wire  [1:0] E_286029953032 ;
 wire  [1:0] E_286229943031 ;
 wire  [15:0] E_287829933030 ;
 wire  [1:0] E_29152998 ;
 wire  [1:0] E_29182997 ;
 wire  [0:15] E_29332996 ;
 wire  [1:0] E_28602995 ;
 wire  [1:0] E_28622994 ;
 wire  [15:0] E_28782993 ;
 wire  [8:0] E_2916 ;
 wire  [15:0] E_2928 ;
 wire  [16:0] E_2930 ;
 wire  [0:15] E_2932 ;
 wire  [7:0] E_2944 ;
 wire  [6:0] E_2947 ;
 wire  [14:0] E_2950 ;
 wire  [6:0] E_2953 ;
 wire  [30:0] E_2955 ;
 wire  [8:0] E_2861 ;
 wire  [15:0] E_2864 ;
assign E_2864 = P_14 ;
 wire  [16:0] E_2874 ;
 wire  [15:0] E_2876 ;
 wire  [7:0] E_2889 ;
 wire  [6:0] E_2892 ;
 wire  [14:0] E_2894 ;
 wire  [6:0] E_2897 ;
 wire  [30:0] E_2899 ;
 wire  [15:0] e2975 ;
assign e2975 = P_17 ;
 wire  signed  [15:0] e2974 ;
assign e2974 = P_16 ;
 wire  [15:0] e2973 ;
assign e2973 = P_15 ;
 wire  [15:0] e2971 ;
assign e2971 = P_13 ;
 wire  [15:0] e2970 ;
assign e2970 = P_12 ;
 wire  signed  [15:0] e2969 ;
assign e2969 = P_11 ;
 wire  [15:0] e2968 ;
assign e2968 = P_10 ;
 wire  [15:0] e2967 ;
assign e2967 = P_9 ;
 wire  [15:0] e2966 ;
assign e2966 = P_8 ;
 wire  [15:0] e2965 ;
assign e2965 = P_7 ;
 wire e2964 ;
assign e2964 = P_6 ;
 wire  [15:0] e2963 ;
assign e2963 = P_5 ;
 wire  signed  [15:0] e2962 ;
assign e2962 = P_4 ;
 wire  [15:0] e2961 ;
assign e2961 = P_3 ;
 wire  [15:0] e2960 ;
assign e2960 = P_2 ;
 wire  [15:0] e2959 ;
assign P_1 = e2959 ;
 wire  [15:0] e ;
assign P_0 = e ;
IPBDP_hier_lossless13  IPBDP_hier_lossless3070 ( .E_2950 ( E_2950 )  , .E_2916 ( E_2916 ) 
		 );
IPBDP_hier_lossless12  IPBDP_hier_lossless3069 ( .e2963 ( e2963 )  , .E_2930 ( E_2930 ) 
		 );
IPBDP_hier_lossless11  IPBDP_hier_lossless3068 ( .e2969 ( e2969 )  , .E_2928 ( E_2928 ) 
		 );
IPBDP_hier_lossy14  IPBDP_hier_lossy3067 ( .E_29182997 ( E_29182997 )  , .E_291829973034 ( E_291829973034 ) 
		 );
IPBDP_hier_lossy13  IPBDP_hier_lossy3066 ( .E_2916 ( E_2916 )  , .E_29182997 ( E_29182997 ) 
		 );
IPBDP_hier_lossy12  IPBDP_hier_lossy3065 ( .E_2928 ( E_2928 )  , .E_2930 ( E_2930 ) 
		 , .E_2932 ( E_2932 )  );
IPBDP_hier_lossless10  IPBDP_hier_lossless3064 ( .E_2950 ( E_2950 )  , .E_2928 ( E_2928 ) 
		 , .E_29152998 ( E_29152998 )  );
IPBDP_hier_lossless9  IPBDP_hier_lossless3063 ( .e2962 ( e2962 )  , .E_2950 ( E_2950 ) 
		 );
IPBDP_hier_lossless8  IPBDP_hier_lossless3062 ( .e2963 ( e2963 )  , .E_2944 ( E_2944 ) 
		 );
IPBDP_hier_lossless7  IPBDP_hier_lossless3061 ( .E_291829973034 ( E_291829973034 ) 
		 , .E_2932 ( E_2932 )  , .E_2864 ( E_2864 )  , .E_2928 ( E_2928 )  , .e2971 ( e2971 )  , .e2970 ( e2970 ) 
		 , .e2963 ( e2963 )  , .E_29332996 ( E_29332996 )  );
IPBDP_hier_lossy11  IPBDP_hier_lossy3060 ( .E_29152998 ( E_29152998 )  , .E_291529983035 ( E_291529983035 ) 
		 );
IPBDP_hier_lossy10  IPBDP_hier_lossy3059 ( .e2964 ( e2964 )  , .E_2947 ( E_2947 ) 
		 , .E_2953 ( E_2953 )  , .e2961 ( e2961 )  , .E_2955 ( E_2955 )  );
IPBDP_hier_lossy9  IPBDP_hier_lossy3058 ( .E_2950 ( E_2950 )  , .E_2953 ( E_2953 ) 
		 );
IPBDP_hier_lossy8  IPBDP_hier_lossy3057 ( .E_2944 ( E_2944 )  , .E_2947 ( E_2947 ) 
		 );
IPBDP_hier_lossy7  IPBDP_hier_lossy3056 ( .E_29332996 ( E_29332996 )  , .E_293329963033 ( E_293329963033 ) 
		 );
IPBDP_hier_lossless6  IPBDP_hier_lossless3055 ( .E_291529983035 ( E_291529983035 ) 
		 , .e2960 ( e2960 )  , .e2968 ( e2968 )  , .e2967 ( e2967 )  , .e2965 ( e2965 )  , .E_2955 ( E_2955 ) 
		 , .e2963 ( e2963 )  , .E_293329963033 ( E_293329963033 )  , .e2966 ( e2966 )  , .e2959 ( e2959 ) 
		 );
IPBDP_hier_lossless5  IPBDP_hier_lossless3054 ( .e2962 ( e2962 )  , .E_2861 ( E_2861 ) 
		 );
IPBDP_hier_lossless4  IPBDP_hier_lossless3053 ( .e2963 ( e2963 )  , .E_2874 ( E_2874 ) 
		 );
IPBDP_hier_lossy6  IPBDP_hier_lossy3052 ( .E_28622994 ( E_28622994 )  , .E_286229943031 ( E_286229943031 ) 
		 );
IPBDP_hier_lossy5  IPBDP_hier_lossy3051 ( .E_2861 ( E_2861 )  , .E_28622994 ( E_28622994 ) 
		 );
IPBDP_hier_lossy4  IPBDP_hier_lossy3050 ( .e2969 ( e2969 )  , .E_2874 ( E_2874 ) 
		 , .E_2876 ( E_2876 )  );
IPBDP_hier_lossless3  IPBDP_hier_lossless3049 ( .e2962 ( e2962 )  , .e2969 ( e2969 ) 
		 , .E_28602995 ( E_28602995 )  );
IPBDP_hier_lossless2  IPBDP_hier_lossless3048 ( .e2962 ( e2962 )  , .E_2894 ( E_2894 ) 
		 );
IPBDP_hier_lossless1  IPBDP_hier_lossless3047 ( .e2963 ( e2963 )  , .E_2889 ( E_2889 ) 
		 );
IPBDP_hier_lossless0  IPBDP_hier_lossless3046 ( .E_286229943031 ( E_286229943031 ) 
		 , .E_2864 ( E_2864 )  , .E_2876 ( E_2876 )  , .e2971 ( e2971 )  , .e2970 ( e2970 )  , .e2963 ( e2963 ) 
		 , .e2969 ( e2969 )  , .E_28782993 ( E_28782993 )  );
IPBDP_hier_lossy3  IPBDP_hier_lossy3045 ( .E_28602995 ( E_28602995 )  , .E_286029953032 ( E_286029953032 ) 
		 );
IPBDP_hier_lossy2  IPBDP_hier_lossy3044 ( .e2964 ( e2964 )  , .E_2892 ( E_2892 ) 
		 , .E_2897 ( E_2897 )  , .e2974 ( e2974 )  , .E_2899 ( E_2899 )  );
IPBDP_hier_lossy1  IPBDP_hier_lossy3043 ( .E_2894 ( E_2894 )  , .E_2897 ( E_2897 ) 
		 );
IPBDP_hier_lossy0  IPBDP_hier_lossy3042 ( .E_2889 ( E_2889 )  , .E_2892 ( E_2892 ) 
		 );
IPBDP_hier_lossy  IPBDP_hier_lossy ( .E_28782993 ( E_28782993 )  , .E_287829933030 ( E_287829933030 ) 
		 );
IPBDP_hier_lossless  IPBDP_hier_lossless ( .E_286029953032 ( E_286029953032 ) 
		 , .e2973 ( e2973 )  , .e2968 ( e2968 )  , .e2967 ( e2967 )  , .e2975 ( e2975 )  , .E_2899 ( E_2899 ) 
		 , .e2963 ( e2963 )  , .E_287829933030 ( E_287829933030 )  , .e2966 ( e2966 )  , .e ( e )  );
   assert property (P_0 == P_1);

   //assert property (e == e2959);
   
endmodule

module IPBDP_hier_lossless13 ( E_2950 , E_2916 ) ;
 input  [14:0]  E_2950 ;
 output  [8:0]  E_2916 ;
  assign /* unsigned  9-bit */  E_2916 = E_2950 ;
endmodule

module IPBDP_hier_lossless12 ( e2963 , E_2930 ) ;
 input  [15:0]  e2963 ;
 output  [16:0]  E_2930 ;
 wire  [2:0] E_2929 ;
  assign /* unsigned  3-bit */  E_2929 = 3'h5;
  assign /* unsigned 17-bit */  E_2930 = E_2929 + e2963 ;
endmodule

module IPBDP_hier_lossless11 ( e2969 , E_2928 ) ;
 input  signed  [15:0]  e2969 ;
 output  [15:0]  E_2928 ;
  assign /* unsigned 16-bit */  E_2928 = e2969 ;
endmodule

module IPBDP_hier_lossy14 ( E_29182997 , E_291829973034 ) ;
 input  [1:0]  E_29182997 ;
 output  [1:0]  E_291829973034 ;
  assign /* unsigned  2-bit */  E_291829973034 = E_29182997 ;
endmodule

module IPBDP_hier_lossy13 ( E_2916 , E_29182997 ) ;
 input  [8:0]  E_2916 ;
 output  [1:0]  E_29182997 ;
 wire  [2:0] E_2917 ;
 wire  [3:0] E_2976 ;
  assign /* unsigned  2-bit */  E_29182997 = E_2916 [ 4'h8 : 3'h7 ] ; 
  assign /* unsigned  3-bit */  E_2917 = 3'h7;
  assign /* unsigned  4-bit */  E_2976 = 4'h8;
endmodule

module IPBDP_hier_lossy12 ( E_2928 , E_2930 , E_2932 ) ;
 input  [15:0]  E_2928 ;
 input  [16:0]  E_2930 ;
 output  [0:15]  E_2932 ;
  assign /* unsigned 16-bit */  E_2932 = E_2928 << E_2930 ;
endmodule

module IPBDP_hier_lossless10 ( E_2950 , E_2928 , E_29152998 ) ;
 input  [14:0]  E_2950 ;
 input  [15:0]  E_2928 ;
 output  [1:0]  E_29152998 ;
 wire  [0:0] E_2908 ;
 wire  signed  [7:0] E_2907 ;
 wire E_2913 ;
 wire E_2912 ;
 wire  [0:0] E_2910 ;
 wire E_2909 ;
 wire E_2914 ;
 wire  [1:0] E_2911 ;
  assign /* unsigned  1-bit */  E_2908 = 1'h0;
  assign /*   signed  8-bit */  E_2907 = E_2928 ;
  assign /* unsigned    bit */  E_2913 = E_2928 ;
  assign /* unsigned    bit */  E_2912 = E_2950 ;
  assign /* unsigned  1-bit */  E_2910 = 1'h1;
wire signed  [1:0]  E_29083071 = E_2908; /* unsign->sign */ 
  assign /* unsigned    bit */  E_2909 = E_2907 < E_29083071 ;
  assign /* unsigned    bit */  E_2914 = E_2912 || E_2913 ;
  assign /* unsigned  2-bit */  E_2911 = E_2909 << E_2910 ;
  assign /* unsigned  2-bit */  E_29152998 = E_2911 + E_2914 ;
endmodule

module IPBDP_hier_lossless9 ( e2962 , E_2950 ) ;
 input  signed  [15:0]  e2962 ;
 output  [14:0]  E_2950 ;
  assign /* unsigned 15-bit */  E_2950 = e2962 ;
endmodule

module IPBDP_hier_lossless8 ( e2963 , E_2944 ) ;
 input  [15:0]  e2963 ;
 output  [7:0]  E_2944 ;
  assign /* unsigned  8-bit */  E_2944 = e2963 ;
endmodule

module IPBDP_hier_lossless7 ( E_291829973034 , E_2932 , E_2864 , E_2928 , e2971
 , e2970 , e2963 , E_29332996 ) ;
 input  [1:0]  E_291829973034 ;
 input  [0:15]  E_2932 ;
 input  [15:0]  E_2864 ;
 input  [15:0]  E_2928 ;
 input  [15:0]  e2971 ;
 input  [15:0]  e2970 ;
 input  [15:0]  e2963 ;
 output  [0:15]  E_29332996 ;
 wire  [0:15] E_2926 ;
 wire  [0:15] E_2923 ;
 wire  [0:15] E_2920 ;
 reg  [0:15] E_29332996 ;
  assign /* unsigned 16-bit */  E_2926 = e2970 * e2963 ;
  assign /* unsigned 16-bit */  E_2923 = E_2928 - e2971 ;
  assign /* unsigned 16-bit */  E_2920 = E_2864 ;
  always @( E_291829973034 or E_2920
	 or E_2923 or E_2926 or E_2932 )
    begin
    case ( E_291829973034 )
      0 : /* unsigned 16-bit */  E_29332996 = E_2920 ;
      1 : /* unsigned 16-bit */  E_29332996 = E_2923 ;
      2 : /* unsigned 16-bit */  E_29332996 = E_2926 ;
      3 : /* unsigned 16-bit */  E_29332996 = E_2932 ;
    endcase
  end
endmodule

module IPBDP_hier_lossy11 ( E_29152998 , E_291529983035 ) ;
 input  [1:0]  E_29152998 ;
 output  [1:0]  E_291529983035 ;
  assign /* unsigned  2-bit */  E_291529983035 = E_29152998 ;
endmodule

module IPBDP_hier_lossy10 ( e2964 , E_2947 , E_2953 , e2961 , E_2955 ) ;
 input  e2964 ;
 input  [6:0]  E_2947 ;
 input  [6:0]  E_2953 ;
 input  [15:0]  e2961 ;
 output  [30:0]  E_2955 ;
  assign /* unsigned 31-bit */  E_2955 = { e2961 , E_2953 , E_2947 , e2964 };
endmodule

module IPBDP_hier_lossy9 ( E_2950 , E_2953 ) ;
 input  [14:0]  E_2950 ;
 output  [6:0]  E_2953 ;
 wire  [3:0] E_2951 ;
 wire  [3:0] E_2952 ;
  assign /* unsigned  7-bit */  E_2953 = E_2950 [ 4'he : 4'h8 ] ; 
  assign /* unsigned  4-bit */  E_2951 = 4'h8;
  assign /* unsigned  4-bit */  E_2952 = 4'he;
endmodule

module IPBDP_hier_lossy8 ( E_2944 , E_2947 ) ;
 input  [7:0]  E_2944 ;
 output  [6:0]  E_2947 ;
 wire  [0:0] E_2945 ;
 wire  [2:0] E_2946 ;
  assign /* unsigned  7-bit */  E_2947 = E_2944 [ 3'h7 : 1'h1 ] ; 
  assign /* unsigned  1-bit */  E_2945 = 1'h1;
  assign /* unsigned  3-bit */  E_2946 = 3'h7;
endmodule

module IPBDP_hier_lossy7 ( E_29332996 , E_293329963033 ) ;
 input  [0:15]  E_29332996 ;
 output  [0:15]  E_293329963033 ;
  assign /* unsigned 16-bit */  E_293329963033 = E_29332996 ;
endmodule

module IPBDP_hier_lossless6 ( E_291529983035 , e2960 , e2968 , e2967 , e2965
 , E_2955 , e2963 , E_293329963033 , e2966 , e2959 ) ;
 input  [1:0]  E_291529983035 ;
 input  [15:0]  e2960 ;
 input  [15:0]  e2968 ;
 input  [15:0]  e2967 ;
 input  [15:0]  e2965 ;
 input  [30:0]  E_2955 ;
 input  [15:0]  e2963 ;
 input  [0:15]  E_293329963033 ;
 input  [15:0]  e2966 ;
 output  [15:0]  e2959 ;
 wire  [15:0] E_2939 ;
 wire E_2934 ;
 wire  [15:0] E_2956 ;
 wire  [15:0] E_2941 ;
 wire  [15:0] E_2937 ;
 reg  [15:0] e2959 ;
  assign /* unsigned 16-bit */  E_2939 = e2966 * e2963 ;
  assign /* unsigned    bit */  E_2934 = e2963 >= E_293329963033 ;
  assign /* unsigned 16-bit */  E_2956 = E_2955 ;
  assign /* unsigned 16-bit */  E_2941 = E_2939 + e2965 ;
  assign /* unsigned 16-bit */  E_2937 = E_2934 ? e2967 : e2968 ;
  always @( E_291529983035 or E_2937
	 or E_2941 or E_2956 or e2960 )
    begin
    case ( E_291529983035 )
      0 : /* unsigned 16-bit */  e2959 = E_2937 ;
      1 : /* unsigned 16-bit */  e2959 = E_2941 ;
      2 : /* unsigned 16-bit */  e2959 = E_2956 ;
      3 : /* unsigned 16-bit */  e2959 = e2960 ;
    endcase
  end
endmodule

module IPBDP_hier_lossless5 ( e2962 , E_2861 ) ;
 input  signed  [15:0]  e2962 ;
 output  [8:0]  E_2861 ;
  assign /* unsigned  9-bit */  E_2861 = e2962 ;
endmodule

module IPBDP_hier_lossless4 ( e2963 , E_2874 ) ;
 input  [15:0]  e2963 ;
 output  [16:0]  E_2874 ;
 wire  [2:0] E_2873 ;
  assign /* unsigned  3-bit */  E_2873 = 3'h5;
  assign /* unsigned 17-bit */  E_2874 = E_2873 + e2963 ;
endmodule

module IPBDP_hier_lossy6 ( E_28622994 , E_286229943031 ) ;
 input  [1:0]  E_28622994 ;
 output  [1:0]  E_286229943031 ;
  assign /* unsigned  2-bit */  E_286229943031 = E_28622994 ;
endmodule

module IPBDP_hier_lossy5 ( E_2861 , E_28622994 ) ;
 input  [8:0]  E_2861 ;
 output  [1:0]  E_28622994 ;
 wire  [2:0] E_2977 ;
 wire  [3:0] E_2978 ;
  assign /* unsigned  2-bit */  E_28622994 = E_2861 [ 4'h8 : 3'h7 ] ; 
  assign /* unsigned  3-bit */  E_2977 = 3'h7;
  assign /* unsigned  4-bit */  E_2978 = 4'h8;
endmodule

module IPBDP_hier_lossy4 ( e2969 , E_2874 , E_2876 ) ;
 input  signed  [15:0]  e2969 ;
 input  [16:0]  E_2874 ;
 output  [15:0]  E_2876 ;
  assign /* unsigned 16-bit */  E_2876 = e2969 <<< E_2874 ;
endmodule

module IPBDP_hier_lossless3 ( e2962 , e2969 , E_28602995 ) ;
 input  signed  [15:0]  e2962 ;
 input  signed  [15:0]  e2969 ;
 output  [1:0]  E_28602995 ;
 wire  [0:0] E_2853 ;
 wire  signed  [7:0] E_2852 ;
 wire E_2858 ;
 wire E_2857 ;
 wire  [0:0] E_2855 ;
 wire E_2854 ;
 wire E_2859 ;
 wire  [1:0] E_2856 ;
  assign /* unsigned  1-bit */  E_2853 = 1'h0;
  assign /*   signed  8-bit */  E_2852 = e2969 ;
  assign /* unsigned    bit */  E_2858 = e2969 ;
  assign /* unsigned    bit */  E_2857 = e2962 ;
  assign /* unsigned  1-bit */  E_2855 = 1'h1;
wire signed  [1:0]  E_28533072 = E_2853; /* unsign->sign */ 
  assign /* unsigned    bit */  E_2854 = E_2852 < E_28533072 ;
  assign /* unsigned    bit */  E_2859 = E_2857 || E_2858 ;
  assign /* unsigned  2-bit */  E_2856 = E_2854 << E_2855 ;
  assign /* unsigned  2-bit */  E_28602995 = E_2856 + E_2859 ;
endmodule

module IPBDP_hier_lossless2 ( e2962 , E_2894 ) ;
 input  signed  [15:0]  e2962 ;
 output  [14:0]  E_2894 ;
  assign /* unsigned 15-bit */  E_2894 = e2962 ;
endmodule

module IPBDP_hier_lossless1 ( e2963 , E_2889 ) ;
 input  [15:0]  e2963 ;
 output  [7:0]  E_2889 ;
  assign /* unsigned  8-bit */  E_2889 = e2963 ;
endmodule

module IPBDP_hier_lossless0 ( E_286229943031 , E_2864 , E_2876 , e2971 , e2970
 , e2963 , e2969 , E_28782993 ) ;
 input  [1:0]  E_286229943031 ;
 input  [15:0]  E_2864 ;
 input  [15:0]  E_2876 ;
 input  [15:0]  e2971 ;
 input  [15:0]  e2970 ;
 input  [15:0]  e2963 ;
 input  signed  [15:0]  e2969 ;
 output  [15:0]  E_28782993 ;
 wire  [15:0] E_2865 ;
 wire  [15:0] E_2871 ;
 wire  [15:0] E_2868 ;
 reg  [15:0] E_28782993 ;
  assign /* unsigned 16-bit */  E_2865 = e2969 ;
  assign /* unsigned 16-bit */  E_2871 = e2970 * e2963 ;
  assign /* unsigned 16-bit */  E_2868 = E_2865 - e2971 ;
  always @( E_286229943031 or E_2864
	 or E_2868 or E_2871 or E_2876 )
    begin
    case ( E_286229943031 )
      0 : /* unsigned 16-bit */  E_28782993 = E_2864 ;
      1 : /* unsigned 16-bit */  E_28782993 = E_2868 ;
      2 : /* unsigned 16-bit */  E_28782993 = E_2871 ;
      3 : /* unsigned 16-bit */  E_28782993 = E_2876 ;
    endcase
  end
endmodule

module IPBDP_hier_lossy3 ( E_28602995 , E_286029953032 ) ;
 input  [1:0]  E_28602995 ;
 output  [1:0]  E_286029953032 ;
  assign /* unsigned  2-bit */  E_286029953032 = E_28602995 ;
endmodule

module IPBDP_hier_lossy2 ( e2964 , E_2892 , E_2897 , e2974 , E_2899 ) ;
 input  e2964 ;
 input  [6:0]  E_2892 ;
 input  [6:0]  E_2897 ;
 input  signed  [15:0]  e2974 ;
 output  [30:0]  E_2899 ;
  assign /* unsigned 31-bit */  E_2899 = { e2974 , E_2897 , E_2892 , e2964 };
endmodule

module IPBDP_hier_lossy1 ( E_2894 , E_2897 ) ;
 input  [14:0]  E_2894 ;
 output  [6:0]  E_2897 ;
 wire  [3:0] E_2895 ;
 wire  [3:0] E_2896 ;
  assign /* unsigned  7-bit */  E_2897 = E_2894 [ 4'he : 4'h8 ] ; 
  assign /* unsigned  4-bit */  E_2895 = 4'h8;
  assign /* unsigned  4-bit */  E_2896 = 4'he;
endmodule

module IPBDP_hier_lossy0 ( E_2889 , E_2892 ) ;
 input  [7:0]  E_2889 ;
 output  [6:0]  E_2892 ;
 wire  [0:0] E_2890 ;
 wire  [2:0] E_2891 ;
  assign /* unsigned  7-bit */  E_2892 = E_2889 [ 3'h7 : 1'h1 ] ; 
  assign /* unsigned  1-bit */  E_2890 = 1'h1;
  assign /* unsigned  3-bit */  E_2891 = 3'h7;
endmodule

module IPBDP_hier_lossy ( E_28782993 , E_287829933030 ) ;
 input  [15:0]  E_28782993 ;
 output  [15:0]  E_287829933030 ;
  assign /* unsigned 16-bit */  E_287829933030 = E_28782993 ;
endmodule

module IPBDP_hier_lossless ( E_286029953032 , e2973 , e2968 , e2967 , e2975
 , E_2899 , e2963 , E_287829933030 , e2966 , e ) ;
 input  [1:0]  E_286029953032 ;
 input  [15:0]  e2973 ;
 input  [15:0]  e2968 ;
 input  [15:0]  e2967 ;
 input  [15:0]  e2975 ;
 input  [30:0]  E_2899 ;
 input  [15:0]  e2963 ;
 input  [15:0]  E_287829933030 ;
 input  [15:0]  e2966 ;
 output  [15:0]  e ;
 wire  [15:0] E_2884 ;
 wire E_2879 ;
 wire  [15:0] E_2900 ;
 wire  [15:0] E_2886 ;
 wire  [15:0] E_2882 ;
 reg  [15:0] e ;
  assign /* unsigned 16-bit */  E_2884 = e2966 * e2963 ;
  assign /* unsigned    bit */  E_2879 = e2963 >= E_287829933030 ;
  assign /* unsigned 16-bit */  E_2900 = E_2899 ;
  assign /* unsigned 16-bit */  E_2886 = E_2884 + e2975 ;
  assign /* unsigned 16-bit */  E_2882 = E_2879 ? e2967 : e2968 ;
  always @( E_286029953032 or E_2882
	 or E_2886 or E_2900 or e2973 )
    begin
    case ( E_286029953032 )
      0 : /* unsigned 16-bit */  e = E_2882 ;
      1 : /* unsigned 16-bit */  e = E_2886 ;
      2 : /* unsigned 16-bit */  e = E_2900 ;
      3 : /* unsigned 16-bit */  e = e2973 ;
    endcase
  end
endmodule

