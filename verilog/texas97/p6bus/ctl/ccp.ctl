#verify the cache coherence protocol
AG(

   (
    (
     ((processor0.CACHE1.DATA_RDY= 1)&&
      (processor0.CACHE1.requestAddress<0>= 0)
     )
    )&&
    (
     (((processor0.CACHE1.cacheTlb0<0>=0)&&( processor1.CACHE1.cacheTlb0<0>=0)) ||
      ((processor0.CACHE1.cacheTlb0<0>=1)&&( processor1.CACHE1.cacheTlb0<0>=1))
     ) &&
     (((processor0.CACHE1.cacheTlb0<1>=0)&&( processor1.CACHE1.cacheTlb0<1>=0)) ||
      ((processor0.CACHE1.cacheTlb0<1>=1)&&( processor1.CACHE1.cacheTlb0<1>=1))
     )
    )
   )

   ->
   ((processor0.CACHE1.processorTag0<0>= 1)&&
    (processor0.CACHE1.processorTag0<1>= 0)&&
    (processor1.CACHE1.processorTag0<0>= 1)&&
    (processor1.CACHE1.processorTag0<1>= 0)
   ) ||
   ((processor0.CACHE1.processorTag0<1>= 1)&&
    (processor1.CACHE1.processorTag0<0>= 0)&&
    (processor1.CACHE1.processorTag0<1>= 0)
   ) ||
   ((processor0.CACHE1.processorTag0<0>= 0)&&
    (processor0.CACHE1.processorTag0<1>= 0)&&
    (processor1.CACHE1.processorTag0<1>= 1)
   ) ||
   ((processor0.CACHE1.processorTag0<0>= 0)&&
    (processor0.CACHE1.processorTag0<1>= 0)&&
    (processor1.CACHE1.processorTag0<0>= 0)&&
    (processor1.CACHE1.processorTag0<1>= 0)
   )
  ) ;

