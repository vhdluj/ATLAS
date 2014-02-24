library ieee;
use ieee.std_logic_1164.all;

Package L1TopoDataTypes is
   
   -- generics for the algorithm module
   
   constant InputWidthEg          : integer:=120;
   constant InputwidthTau         : integer:=120;
   constant InputWidthJet         : integer:=64;
   constant InputWidth1stStageEg  : integer:=20;
   constant InputWidth1stStageTau : integer:=20;
   constant InputWidth1stStageJet : integer:=16;
   constant OutputWidthEg         : integer:=6;
   constant OutputWidthTau        : integer:=6;
   constant OutputWidthJet        : integer:=10;
   constant NumAlgos              : integer:=9;
   constant NumResultBits         : integer:=9;
   constant NumberOfMgts          : integer:=80;
   constant NumberOfQuads         : integer:=20;
   
   -- Maximum number of components that require parameters

   constant max_components : integer := 70;

   -- Max number of TOBs to be received by L1Topo

   constant max_jets : integer := 48;
   constant max_clusters : integer := 80;

   -- Max number of TOBs to be analysed by inclusive algorithms:

   constant max_incl_jets : integer := 8;
   constant max_incl_clusters : integer := 8;
    
    
    --Internal Data width
    constant data_width : integer :=32;
    --Internal Data from MGTs 
    type InternalData is array (natural range <>) of std_logic_vector(data_width - 1 downto 0);
    type ChannelData  is array (natural range <>) of InternalData(3 downto 0);
   
   -- TOB data are arranged as arrays of records. Use these for unsorted/presorted TOBs:
   
   
   type ClusterTOB is record
             Et : std_logic_vector (7 downto 0);
             isol:  std_logic_vector (4 downto 0);
             eta: std_logic_vector (5 downto 0);
             phi: std_logic_vector (5 downto 0);    
   end record;

   type JetTOB is record
             Et1 : std_logic_vector (8 downto 0);
             Et2:  std_logic_vector (9 downto 0);
             eta: std_logic_vector (4 downto 0);
             phi: std_logic_vector (4 downto 0);    
   end record;

   type ClusterArray is array (natural range <>) of ClusterTOB;
   type JetArray is array (natural range <>) of JetTOB;

   -- After selection and sorting, TOB data are all of same type.
   -- Use a generic TOB record for sorted TOBs:

   type GenericTOB is record
             Et : std_logic_vector (9 downto 0); -- Pad unused bits with zeros, they will be optimised away
             eta: std_logic_vector (5 downto 0); -- Again, pad bottom bit with zero for muons and jets
             phi: std_logic_vector (5 downto 0);    
   end record;

   type TOBArray is array (natural range <>) of GenericTOB;

   -- Parameters for configuring the trigger algorithms

   constant MaxParams : integer := 5;  -- Maximum number of parameters

   type ParameterArray is array (MaxParams-1 downto 0) of std_logic_vector(data_width - 1 downto 0);
   type ParameterSpace is array (natural range <>) of ParameterArray;
   
 end L1TopoDataTypes;
 
 package body L1TopoDataTypes is  
   
  
end L1TopoDataTypes;  