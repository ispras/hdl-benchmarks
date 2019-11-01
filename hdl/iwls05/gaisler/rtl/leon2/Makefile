
VLIB = vlib
VCOM = vcom -quiet
VLOG = vlog -quiet
LIBS = tags work
XCOMP = $(XILINX)/vhdl/src/unisims/unisim_VPKG.vhd  \
	$(XILINX)/vhdl/src/unisims/unisim_VCOMP.vhd \
	$(XILINX)/vhdl/src/unisims/unisim_VITAL.vhd

tags/%.tag : %.vhd
	$(VCOM) $<
	@touch $@

tags/%.tag : %.v
	$(VLOG) $<
	@touch $@

all: $(LIBS) leon leon_pci  leon_eth leon_eth_pci

tags/amba.tag : amba.vhd
amba : tags/amba.tag 
tags/bprom.tag : bprom.vhd
bprom : tags/bprom.tag 
tags/dma.tag : tags/amba.tag tags/iface.tag tags/ambacomp.tag tags/ahbmst.tag dma.vhd
dma : tags/dma.tag 
tags/ahbmst.tag : tags/amba.tag tags/iface.tag tags/ambacomp.tag ahbmst.vhd
ahbmst : tags/ahbmst.tag 
tags/dsu.tag : tags/iface.tag tags/debug.tag tags/tech_map.tag dsu.vhd
dsu : tags/dsu.tag 
tags/dsu_mem.tag : tags/iface.tag tags/tech_map.tag dsu_mem.vhd
dsu_mem : tags/dsu_mem.tag 
tags/dcom_uart.tag : tags/amba.tag tags/macro.tag dcom_uart.vhd
dcom_uart : tags/dcom_uart.tag
tags/dcom.tag : tags/amba.tag tags/iface.tag tags/ambacomp.tag tags/ahbmst.tag \
	tags/dcom_uart.tag  dcom.vhd
dcom : tags/dcom.tag 
tags/tech_virtex2.tag : tags/config.tag tags/tech_generic.tag tech_virtex2.vhd
tech_virtex2 : tags/tech_virtex2.tag 
tags/tech_proasic.tag : tags/config.tag tags/tech_generic.tag tech_proasic.vhd
tech_proasic : tags/tech_proasic.tag 
tags/tech_axcel.tag : tags/config.tag tags/tech_generic.tag tech_axcel.vhd
tech_axcel : tags/tech_axcel.tag 
tags/tech_virtex.tag : tags/config.tag tags/tech_generic.tag tech_virtex.vhd
tech_virtex : tags/tech_virtex.tag 
tags/tech_generic.tag : tags/config.tag tags/iface.tag tech_generic.vhd
tech_generic : tags/tech_generic.tag 
tags/tech_umc18.tag : tags/iface.tag tags/tech_generic.tag tech_umc18.vhd
tech_umc18 : tags/tech_umc18.tag 
tags/tech_fs90.tag : tags/iface.tag tags/tech_generic.tag tech_fs90.vhd
tech_fs90 : tags/tech_fs90.tag 
tags/tech_atc18.tag : tags/iface.tag tags/tech_generic.tag tech_atc18.vhd
tech_atc18 : tags/tech_atc18.tag 
tags/tech_atc25.tag : tags/iface.tag tags/tech_generic.tag tech_atc25.vhd
tech_atc25 : tags/tech_atc25.tag 
tags/tech_tsmc25.tag : tags/iface.tag tags/tech_generic.tag tech_tsmc25.vhd
tech_tsmc25 : tags/tech_tsmc25.tag 
tags/tech_atc35.tag : tags/config.tag tags/tech_generic.tag tech_atc35.vhd
tech_atc35 : tags/tech_atc35.tag 
tags/macro.tag : tags/iface.tag macro.vhd
macro : tags/macro.tag
tags/debug.tag : tags/iface.tag debug.vhd
debug : tags/debug.tag 
tags/multlib.tag : tags/iface.tag multlib.vhd
multlib : tags/multlib.tag 
tags/div.tag : tags/iface.tag div.vhd
div : tags/div.tag 
tags/mul.tag : tags/iface.tag tags/tech_map.tag mul.vhd
mul : tags/mul.tag 
tags/ambacomp.tag : tags/amba.tag tags/iface.tag tags/config.tag ambacomp.vhd
ambacomp : tags/ambacomp.tag 
tags/ahbtest.tag : tags/amba.tag tags/iface.tag tags/dma.tag ahbtest.vhd
ahbtest : tags/ahbtest.tag 
tags/pci_gr.tag : tags/amba.tag tags/iface.tag tags/ambacomp.tag tags/ahbmst.tag pci_gr.vhd
pci_gr : tags/pci_gr.tag 
tags/ahbarb.tag : tags/amba.tag tags/iface.tag ahbarb.vhd
ahbarb : tags/ahbarb.tag 
tags/ahbstat.tag : tags/amba.tag tags/iface.tag ahbstat.vhd
ahbstat : tags/ahbstat.tag 
tags/wprot.tag : tags/amba.tag tags/iface.tag wprot.vhd
wprot : tags/wprot.tag 
tags/lconf.tag : tags/amba.tag tags/iface.tag lconf.vhd
lconf : tags/lconf.tag 
tags/acache.tag : tags/amba.tag tags/macro.tag acache.vhd
acache : tags/acache.tag 
tags/mmu_acache.tag : tags/amba.tag tags/macro.tag mmu_acache.vhd
mmu_acache : tags/mmu_acache.tag 
tags/apbmst.tag : tags/amba.tag tags/iface.tag apbmst.vhd
apbmst : tags/apbmst.tag 
tags/ahbram.tag : tags/iface.tag tags/amba.tag tags/tech_map.tag ahbram.vhd
ahbram : tags/ahbram.tag 
tags/target.tag : target.vhd
target : tags/target.tag
tags/device.tag : tags/target.tag device.vhd
device : tags/device.tag
tags/config.tag : tags/target.tag tags/device.tag config.vhd
config : tags/config.tag
tags/mmuconfig.tag : tags/config.tag mmuconfig.vhd
mmuconfig : tags/mmuconfig.tag
tags/sparcv8.tag : tags/config.tag sparcv8.vhd
sparcv8 : tags/sparcv8.tag
tags/iface.tag : tags/sparcv8.tag tags/target.tag tags/mmuconfig.tag iface.vhd
iface : tags/iface.tag
tags/rstgen.tag : tags/config.tag tags/iface.tag rstgen.vhd
rstgen : tags/rstgen.tag
tags/mpciif.tag : tags/config.tag tags/iface.tag mpciif.vhd
mpciif : tags/mpciif.tag
tags/meiko.tag : tags/config.tag tags/iface.tag meiko.vhd
meiko : tags/meiko.tag
tags/fpu_lth.tag : tags/config.tag tags/iface.tag fpu_lth.vhd
fpu_lth : tags/fpu_lth.tag
tags/fpulib.tag : tags/iface.tag tags/meiko.tag tags/fpu_lth.tag fpulib.vhd
fpulib : tags/fpulib.tag
tags/fpu_core.tag : tags/fpulib.tag fpu_core.vhd
fpu_core : tags/fpu_core.tag
tags/grfpc.tag : tags/fpulib.tag grfpc.vhd
grfpc : tags/grfpc.tag
tags/fp1eu.tag : tags/fpu_core.tag tags/iface.tag tags/macro.tag tags/debug.tag tags/tech_map.tag fp1eu.vhd
fp1eu : tags/fp1eu.tag
#tags/fp.tag : tags/fpulib.tag tags/meiko.tag tags/iface.tag tags/macro.tag tags/debug.tag fp.vhd
#fp : tags/fp.tag
#tags/cp.tag : tags/iface.tag tags/macro.tag cp.vhd
#cp : tags/cp.tag
tags/iu.tag : tags/macro.tag tags/mul.tag tags/div.tag tags/mmuconfig.tag iu.vhd
iu : tags/iu.tag
tags/tech_map.tag : tags/iface.tag tags/tech_generic.tag tags/tech_atc35.tag \
	tags/tech_tsmc25.tag tags/tech_atc25.tag tags/tech_virtex.tag \
	tags/tech_fs90.tag tags/tech_atc18.tag tags/tech_virtex2.tag\
	tags/tech_umc18.tag tags/bprom.tag tags/multlib.tag \
	tags/tech_proasic.tag tags/tech_axcel.tag tech_map.vhd
tech_map : tags/tech_map.tag
tags/dcache.tag : tags/macro.tag dcache.vhd
dcache : tags/dcache.tag
tags/mmu_dcache.tag : tags/macro.tag mmu_dcache.vhd
dcache : tags/mmu_dcache.tag
tags/icache.tag : tags/macro.tag icache.vhd
icache : tags/icache.tag
tags/mmu_icache.tag : tags/macro.tag mmu_icache.vhd
mmu_icache : tags/mmu_icache.tag
tags/cachemem.tag : tags/tech_map.tag tags/macro.tag cachemem.vhd
cachemem : tags/cachemem.tag
tags/cache.tag : tags/amba.tag tags/icache.tag tags/dcache.tag tags/acache.tag cache.vhd
cache : tags/cache.tag
tags/mmu_cache.tag : tags/amba.tag tags/mmu_icache.tag tags/mmu_dcache.tag \
	tags/mmu_acache.tag tags/mmu.tag cache.vhd
mmu_cache : tags/mmu_cache.tag
tags/proc.tag : tags/iu.tag tags/cache.tag tags/fpu_core.tag tags/grfpc.tag \
	tags/fp1eu.tag tags/tech_map.tag tags/mmu_cache.tag tags/cachemem.tag proc.vhd
proc : tags/proc.tag
tags/irqctrl.tag : tags/amba.tag tags/macro.tag irqctrl.vhd
irqctrl : tags/irqctrl.tag
tags/irqctrl2.tag : tags/amba.tag tags/macro.tag irqctrl2.vhd
irqctrl2 : tags/irqctrl2.tag
tags/ioport.tag : tags/amba.tag tags/macro.tag ioport.vhd
ioport : tags/ioport.tag
tags/timers.tag : tags/amba.tag tags/macro.tag timers.vhd
timers : tags/timers.tag
tags/pci_arb.tag : tags/iface.tag tags/amba.tag pci_arb.vhd
pci_arb : tags/pci_arb.tag
tags/ethermac.tag : tags/tech_map.tag device.v eth_top.v ethermac.v
ethermac : tags/ethermac.tag
tags/eth_oc.tag : tags/config.tag tags/iface.tag tags/ethermac.tag tags/ambacomp.tag eth_oc.vhd
eth_oc : tags/eth_oc.tag
tags/pci.tag : tags/iface.tag tags/amba.tag \
	tags/pci_gr.tag tags/ambacomp.tag pci.vhd
pci : tags/pci.tag
tags/uart.tag : tags/amba.tag tags/macro.tag uart.vhd
uart : tags/uart.tag
tags/sdmctrl.tag : tags/config.tag tags/amba.tag tags/macro.tag tags/tech_map.tag sdmctrl.vhd
sdmctrl : tags/sdmctrl.tag
tags/mctrl.tag : tags/config.tag tags/amba.tag tags/macro.tag \
	tags/tech_map.tag tags/sdmctrl.tag mctrl.vhd
mctrl : tags/mctrl.tag
tags/mcore.tag : tags/rstgen.tag tags/ambacomp.tag tags/proc.tag tags/mctrl.tag tags/pci_arb.tag \
	tags/uart.tag tags/timers.tag tags/ioport.tag tags/ahbarb.tag tags/apbmst.tag \
	tags/wprot.tag tags/ahbstat.tag tags/ahbtest.tag tags/pci.tag \
	tags/lconf.tag tags/irqctrl.tag tags/pci.tag tags/irqctrl2.tag \
	tags/eth_oc.tag \
	tags/dcom.tag tags/dsu.tag tags/dsu_mem.tag tags/ahbram.tag mcore.vhd
mcore : tags/mcore.tag

tags/leon.tag : tags/tech_map.tag tags/mcore.tag tags/debug.tag leon.vhd
leon : tags/leon.tag

tags/leon_pci.tag : tags/leon.tag leon_pci.vhd
leon_pci : tags/leon_pci.tag
tags/leon_eth.tag : tags/leon.tag leon_eth.vhd
leon_eth : tags/leon_eth.tag
tags/leon_eth_pci.tag : tags/leon.tag leon_eth_pci.vhd
leon_eth_pci : tags/leon_eth_pci.tag

tags/mmulrue.tag : tags/iface.tag tags/mmuconfig.tag tags/config.tag mmulrue.vhd
mmulrue : tags/mmulrue.tag
tags/mmulru.tag : tags/iface.tag tags/mmuconfig.tag tags/mmulrue.tag mmulru.vhd
mmulru : tags/mmulru.tag
tags/mmutlbcam.tag : tags/iface.tag tags/mmuconfig.tag tags/tech_map.tag mmutlbcam.vhd
mmutlbcam : tags/mmutlbcam.tag
tags/mmutlb.tag : tags/iface.tag tags/mmutlbcam.tag tags/mmuconfig.tag tags/target.tag tags/mmulru.tag mmutlb.vhd
mmutlb : tags/mmutlb.tag
tags/mmutw.tag : tags/iface.tag tags/mmuconfig.tag mmutw.vhd
mmutw : tags/mmutw.tag
tags/mmu.tag : tags/iface.tag tags/mmuconfig.tag tags/mmutlb.tag tags/mmutw.tag mmu.vhd
mmu : tags/mmu.tag
tags/mmuconfig.tag : tags/target.tag tags/device.tag tags/config.tag mmuconfig.vhd
mmuconfig: tags/mmuconfig.tag

xlib: $(LIBS)
	@xcv=`grep virtex device.vhd | awk '{print $$3}' | head -1` ; \
	case "$$xcv" in \
	  virtex*) \
	    if test "$(XILINX)" != ""; then \
	      echo TECH = $$xcv; \
	      echo "compiling xilinx technology cells from $(XILINX)"; \
	      $(VCOM) $(XCOMP); \
	    fi;; \
	  *) echo Xilinx gate models not found;; \
	esac; \
	touch tags/xcomp.tag;

tags : 
	mkdir tags
work : 
	$(VLIB) work

clean:
	-rm -rf tags work *.tags vcx* trnscr* core vsim.wav *.o
