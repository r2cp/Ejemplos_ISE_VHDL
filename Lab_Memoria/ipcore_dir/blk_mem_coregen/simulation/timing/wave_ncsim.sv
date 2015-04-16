
 
 
 




window new WaveWindow  -name  "Waves for BMG Example Design"
waveform  using  "Waves for BMG Example Design"


      waveform add -signals /blk_mem_coregen_tb/status
      waveform add -signals /blk_mem_coregen_tb/blk_mem_coregen_synth_inst/bmg_port/CLKA
      waveform add -signals /blk_mem_coregen_tb/blk_mem_coregen_synth_inst/bmg_port/ADDRA
      waveform add -signals /blk_mem_coregen_tb/blk_mem_coregen_synth_inst/bmg_port/DOUTA
console submit -using simulator -wait no "run"
