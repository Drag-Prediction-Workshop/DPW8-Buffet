#!MC 1410
$!DRAWGRAPHICS FALSE

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
#   DPW-8/AePW-4 AIRFOIL CONTOUR PLOT IMAGE GENERATOR (Version 5 - October 16, 2024)
#
#       INSTRUCTIONS:
#                  1.   Load Fuselage and Wing Surface Zones into Tecplot
#                  2.   Assign ParticipantID variable as the identifier of the dataset
#                  3.   Assign (Xvar,Yvar,Zvar) variables to the variable number in dataset (typically 1,2,3)
#                  4.   Assign CPvar variable to the variable number in dataset
#                  5.   Assign CFvar variable to the variable number in dataset (if exists)
#                  6.   Assign CFXvar,CFYvar,CFZvar variables to the variable number in dataset (if exists)
#                  8.   Assign BodyMaps variable to define which zones define the fuselage surface(s)
#                  9.   Assign WingMaps variable to define which zones define the wing surface(s)
#                 10.   Assign PlotTime variable (if multiple time steps are included in dataset) to define which solution time should be used
#                 11.   Select sectional cut stations under section titled "Create Sectional Cuts" on Line 395 --> do not change anything else
#
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#
#            USER CUSTOM READ DATA COMMAND
#            - Go to Scripting --> Record Macro
#            - Manually read your dataset and stop recording
#            - Copy the resulting macro command here
#            - Note the required variables for entry below (variable numbers, maps, etc.)
#
$!ReadDataSet  '"D:\ANSYS Work\Buffet Workshop\RANS SA\L4\Data\Wall\bpw_oat15a_L4_a1_36_SS_wall.plt" '
  ReadDataOption = New
  ResetStyle = No
  VarLoadMode = ByName
  AssignStrandIDs = Yes
  VarNameList = '"CoordinateX" "CoordinateY" "CoordinateZ" "X Component Position" "X Component Wall Shear" "X Component Velocity" "Pressure Coefficient" "Y Component Position" "Y Component Wall Shear" "Y Component Velocity" "Z Component Position" "Z Component Wall Shear" "Z Component Velocity" "skin-friction-coef"'
$!AlterData 
  IgnoreDivideByZero = Yes
  Equation = '{x_cf} = {X Component Wall Shear}/(0.5*0.9230155*240.9019**2)'
$!AlterData 
  IgnoreDivideByZero = Yes
  Equation = '{y_cf} = {Y Component Wall Shear}/(0.5*0.9230155*240.9019**2)'
$!AlterData 
  IgnoreDivideByZero = Yes
  Equation = '{z_cf} = {Z Component Wall Shear}/(0.5*0.9230155*240.9019**2)'
#
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#
#            PLOT OUTPUT LOCATION
#
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

# CaseX - Case [Case1/Case2/Case3/Case4/Case5/Case6]
# XXX   - First-author participant's last name (or organization)
# XxQ   - Condition Q [LoQ/HiQ/NoQ]
# Lx    - Grid Level [L1/L2/L3/L4/L5/L6]
# Axxx  - Angle of Attack [275/300/325/350/375/400/425]
#         (use C058 for Fixed CL=0.58 case)
#
# Grid/SolverVer/Method/TurbModel should be descriptive labels specific to your case
#
$!VarSet |ParticipantID|        = '027.2'  # Participant ID for this data set
$!VarSet |Configuration|        = 'ONERA-OAT15A'  # Or CRM or Joukowski or...
$!VarSet |OutputDirectoryPath|  = '/png'   # Images will be saved to this path
                                       # NOTE: Use '' if launching Tecplot from the command line within the desired directory

#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#
#            PLOT TITLE SOLUTION INFORMATION
#
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

$!VarSet |LOFTNAME| = 'MyAirfoil.iges'    # Name of geometry file (or committee-supplied grid name)
$!VarSet |REYN|     = '3e6'    # Reynolds number [05 or 20 or 30] (based on reference chord)
$!VarSet |MACH|     = '0.73'   # Mach number
$!VarSet |ALPHA|    = '1.36'  # Angle-of-Attack
$!VarSet |CL|       = '0.768'  # Lift Coefficient
$!VarSet |CD|       = '0.0137' # Drag Coefficient
$!VarSet |CMy|      = '0.130' # Pitching Moment Coefficient


#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#
$!VarSet |Xvar|   =  1      # Variable number to use for X coordinate (running from fuselage nose to tail)
$!VarSet |Yvar|   =  2      # Variable number to use for Y coordinate (running from symmetry plane to wing tip)
$!VarSet |Zvar|   =  3      # Variable number to use for Z coordinate (running from fuselage keel to crown)
$!VarSet |CPvar|  =  7      # Variable number to use for Cp
$!VarSet |CFvar|  =  14      # Variable number to use for Cf contours
$!VarSet |CFXvar| =  15      # Variable number to use for Cfx contours
$!VarSet |CFYvar| =  16      # Variable number to use for Cfx contours
$!VarSet |CFZvar| =  17      # Variable number to use for Cfx contours
$!VarSet |Uvar|   =  6      # Variable number to use for x-component of velocity vector in streamtraces
$!VarSet |Vvar|   =  10     # Variable number to use for y-component of velocity vector in streamtraces
$!VarSet |Wvar|   =  13     # Variable number to use for z-component of velocity vector in streamtraces
$!VarSet |WingMaps| = '1-3' # Fieldmaps of your dataset to plot for the wing or airfoil  ('1-2','1,3,5-6',etc.)
$!VarSet |PlotTime| = ''    # Tecplot SolutionTime variable to export for time-accurate data sets
#                           # NOTE: Use |PlotTime| == '' if no solution time needs to be set.

$!VarSet |EnableStreamlines| =    1 # Enable auto-streamline generation

#
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#
# ! ! ! E N D   O F   U S E R   I N P U T ! ! !
#
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


$!VarSet |ImageWidth|        = 1350 # Output picture pixel width

$!VarSet |Xrev|   =  0      # Set to 1 ONLY if X-axis is running from fuselage tail to nose (negative drag direction)
$!VarSet |Yrev|   =  1      # Set to 1 ONLY if Y-axis is running from wing tip to the symmetry plane
$!VarSet |Zrev|   =  0      # Set to 1 ONLY if Z-axis is running from fuselage crown to keel (negative lift direction)

#-------------------------------------

$!SetStyleBase Factory
$!GlobalPaper
  PaperSizeInfo { Letter { Width = 8.5 Height = 11 LeftHardClipOffset = 0.125 RightHardClipOffset = 0.125 TopHardClipOffset = 0.125 BottomHardClipOffset = 0.125 } }
$!Page
  Name = 'Untitled'
  PaperAttributes
    {
    BackgroundColor = White
    IsTransparent = Yes
    OrientPortrait = No
    ShowGrid = Yes
    ShowRuler = No
    ShowPaper = No
    PaperSize = Letter
    RulerSpacing = OneInch
    PaperGridSpacing = HalfInch
    RegionInWorkArea { X1 = 1  Y1 = 0.25 X2 = 10 Y2 = 8.25 }
    }

$!FrameLayout
  ShowHeader = Yes
  HeaderColor = White
  XYPos { X = 1 Y = 0.25 }
  Width = 9
  Height = 8
$!FrameName  = 'Frame 001'

$!PlotType  = Cartesian3D
$!GlobalRGB
  RedChannelVar = 3
  GreenChannelVar = 3
  BlueChannelVar = 3
  RangeMin = 0
  RangeMax = 1

$!Interface ZoneBoundingBoxMode = Off

$!BASICCOLOR CUSTOM9  { R = 210 G = 210 B = 210 }

$!ThreeDAxis
  XDetail { ShowAxis = No }
  YDetail { ShowAxis = No }
  ZDetail { ShowAxis = No }

$!ThreeDAxis FrameAxis{Show = No}

#-------------------------------------
# Scaling/Translating Dataset (wind tunnel/metric->inches/etc.)
#

# Reverse coordinate axes, if required by user input
$!IF |Xrev| == 1
   $!AlterData
     Equation = 'V|Xvar| = -1 * V|Xvar|'
   $!AlterData
     Equation = 'V|Uvar| = -1 * V|Uvar|'
   $!IF |CFXvar| != |Uvar|
      $!AlterData
        Equation = 'V|CFXvar| = -1 * V|CFXvar|'
  $!ENDIF
$!ENDIF

$!IF |Yrev| == 1
   $!AlterData
     Equation = 'V|Yvar| = -1 * V|Yvar|'
   $!AlterData
     Equation = 'V|Vvar| = -1 * V|Vvar|'
$!ENDIF

$!IF |Zrev| == 1
   $!AlterData
     Equation = 'V|Zvar| = -1 * V|Zvar|'
   $!AlterData
     Equation = 'V|Wvar| = -1 * V|Wvar|'
$!ENDIF



# Calculate scaling based on grid coordinate ranges
$!ACTIVEFIELDMAPS = [|WingMaps|]

$!VarSet |Xle|      = ( |MINX%.12f| )
$!VarSet |Xte|      = ( |MAXX%.12f| )
$!VarSet |YRoot|    = ( |MINY%.12f| )
$!VarSet |YTip|     = ( |MAXY%.12f| )
$!VarSet |ZBot|     = ( |MINZ%.12f| )
$!VarSet |ZTop|     = ( |MAXZ%.12f| )

$!VarSet |Chord|    = ( |Xte| - |Xle|)

$!AlterData
  Equation = 'V|Xvar| = (V|Xvar| - |Xle|)    / |Chord|'
$!AlterData
  Equation = 'V|Yvar| = (V|Yvar| - |YRoot|)  / |Chord|'
$!AlterData
  Equation = 'V|Zvar| = (V|Zvar|             / |Chord|)'


#-------------------------------------
# Name variables consistently
$!RenameDataSetVar
  Var = |Xvar|
  Name = 'X'
$!RenameDataSetVar
  Var = |Yvar|
  Name = 'Y'
$!RenameDataSetVar
  Var = |Zvar|
  Name = 'Z'
$!RenameDataSetVar
  Var = |CPvar|
  Name = 'C<sub>P</sub>'
$!RenameDataSetVar
  Var = |CFvar|
  Name = 'C<sub>F</sub>'
$!RenameDataSetVar
  Var = |CFXvar|
  Name = 'C<sub>Fx</sub>'

$!AlterData 
  IgnoreDivideByZero = Yes
  Equation = '{dC</sub>P</sub>/dx} = abs(ddx({C<sub>P</sub>}))'
$!VarSet |dCPVarNum| = |NUMVARS|

$!AlterData 
  IgnoreDivideByZero = Yes
  Equation = '{dC</sub>F</sub>/dx} = abs(ddx({C<sub>F</sub>}))'
$!VarSet |dCFVarNum| = |NUMVARS|


#-------------------------------------
#-------------------------------------
# Set center of view and re-scale frame
$!VarSet |Span|     = ( |MAXY%.12f| )
$!VarSet |SemiSpan| = ( |Span|/2)

$!VarSet |RotX|     = 0.573        # Center of view (shifted so there's room for the contour legend
$!VarSet |RotY|     = |SemiSpan|   # Midspan
$!VarSet |RotZ|     = 0            # 0
$!VarSet |ViewZ|    = 200          # 0

# Make frame fit the data
$!VarSet |TargetHeight| = ( |Span| * 9 + 0.8 )
$!IF |TargetHeight| < 3.3
   $!VarSet |FrameHeight| = 3.3
$!ELSE
   $!VarSet |FrameHeight| = |TargetHeight|
$!ENDIF
$!FrameLayout Height = |FrameHeight|

$!VarSet |NumStreamsFull| = ( |Span|/0.1 * 3 )
$!VarSet |NumStreams|     = ( |NumStreamsFull%d| )


#-------------------------------------
#-------------------------------------
$!MACROFUNCTION
  NAME = "ExportContours"

   $!Varset |ContourLabel|         = '|1|'
   $!Varset |EnableStreamlinesNow| = '|2|'
   $!Varset |PlottedSurface|       = '|3|'
   $!Varset |Maps|                 = '|4|'
   $!Varset |LineColorStream|      = '|5|'
   $!Varset |LineColorNoStream|    = '|6|'
  #$!Varset |OutputPrepend|     = '|999|'
 
   $!IF       '|ContourLabel|' == 'Cp'
      $!Varset |ContourGroup| = 1
   $!ELSEIF   '|ContourLabel|' == 'Cf'
      $!Varset |ContourGroup| = 2
   $!ELSEIF   '|ContourLabel|' == 'Cfx'
      $!Varset |ContourGroup| = 3
   $!ENDIF
   
   # Set text to label airfoil surface
   $!IF |PlottedSurface| == 1
      # No math
      $!Varset |SurfaceTag| = 'Upper'
   $!ELSE
      $!Varset |SurfaceTag| = 'Lower'
       $!AlterData
         Equation = 'V|Zvar| = -1 * V|Zvar|'
   $!ENDIF
 
   $!Varset |FloodColor| = 'Group|ContourGroup|'
   $!FieldMap  [|Maps|] Contour { LineContourGroup = |ContourGroup| FloodColoring = |FloodColor| }
   
   $!IF |EnableStreamlinesNow| == 1
     $!STREAMTRACELAYERS SHOW = Yes
     $!StreamAttributes Color = |LineColorStream|
     $!FieldMap [|WingMaps|] Contour{ContourType = BothLinesAndFlood Color = |LineColorStream|}
     $!ExportSetup ExportFName = '|ParticipantID|_|Configuration|_|SurfaceTag|_|ContourLabel|_Stream.png'
     $!Export
       ExportRegion = AllFrames
   $!ENDIF
 
   $!STREAMTRACELAYERS SHOW = No
   $!FieldMap [|WingMaps|] Contour{ContourType = BothLinesAndFlood Color = |LineColorNoStream|}
   $!ExportSetup ExportFName = '|ParticipantID|_|Configuration|_|SurfaceTag|_|ContourLabel|.png'
   $!Export
     ExportRegion = AllFrames
 
   $!FieldMap  [|Maps|] Contour { LineContourGroup = 1 FloodColoring = Group1 }
   
   # Flip back if the lower surface
   $!IF |PlottedSurface| == 1
      # No math
   $!ELSE
      $!AlterData
        Equation = 'V|Zvar| = -1 * V|Zvar|'
   $!ENDIF
$!ENDMACROFUNCTION


#-------------------------------------
# Define color maps
$!CreateColorMap
  Name = 'Small_Rainbow_DPW'
  NumControlPoints = 5
  ControlPoint 1 { ColorMapFraction = 0.00 LeadRGB { R=0   G=0   B=255 } TrailRGB { R=0   G=0   B=255 } }
  ControlPoint 2 { ColorMapFraction = 0.25 LeadRGB { R=0   G=255 B=255 } TrailRGB { R=0   G=255 B=255 } }
  ControlPoint 3 { ColorMapFraction = 0.50 LeadRGB { R=0   G=255 B=0   } TrailRGB { R=0   G=255 B=0   } }
  ControlPoint 4 { ColorMapFraction = 0.75 LeadRGB { R=255 G=255 B=0   } TrailRGB { R=255 G=255 B=0   } }
  ControlPoint 5 { ColorMapFraction = 1.00 LeadRGB { R=255 G=0   B=0   } TrailRGB { R=255 G=0   B=0   } }

$!CreateColorMap 
  Name = 'CfMap_DPW'
  NumControlPoints = 5
  ControlPoint 1 { ColorMapFraction = 0.00 LeadRGB { R=0   G=0   B=0   } TrailRGB { R=0   G=0   B=0   } }
  ControlPoint 2 { ColorMapFraction = 0.25 LeadRGB { R=0   G=191 B=255 } TrailRGB { R=0   G=191 B=255 } }
  ControlPoint 3 { ColorMapFraction = 0.50 LeadRGB { R=127 G=255 B=0   } TrailRGB { R=127 G=255 B=0   } }
  ControlPoint 4 { ColorMapFraction = 0.75 LeadRGB { R=255 G=0   B=64  } TrailRGB { R=255 G=0   B=64  } }
  ControlPoint 5 { ColorMapFraction = 1.00 LeadRGB { R=255 G=255 B=255 } TrailRGB { R=255 G=255 B=255 } }
#-------------------------------------
$!ThreeDAxis
  XDetail { ShowAxis = No }
  YDetail { ShowAxis = No }
  ZDetail { ShowAxis = No }

$!ThreeDAxis FrameAxis{Show = No}

$!GlobalContour  1
  Var = |CPvar|
  ColorMapName = 'Small_Rainbow_DPW'
  DefNumLevels = 12
  Legend { Show = Yes IsVertical = Yes RowSpacing = 1.0 XYPos { X = 87 Y = 50 } Box { BoxType = None } AnchorAlignment = MiddleLeft }
  Legend { NumberTextShape{FontFamily = 'FreeSans'} NumberTextShape{SizeUnits = Point} NumberTextShape{Height = 14.4} }
  Legend { HeaderTextShape{FontFamily = 'FreeSans'} HeaderTextShape{SizeUnits = Point} HeaderTextShape{Height = 14.4} }
  
  ColorCutoff { RangeMin = -1.0 RangeMax = 0.6 }
  ColorMapFilter { ColorMapDistribution = Continuous ContinuousColor { CMin = -1.6 CMax = 0.6 } UseFastApproxContinuousFlood = Yes ReverseColorMap = Yes }

$!ContourLevels New
  ContourGroup = 1
  RawData
12
-1.6
-1.4
-1.2
-1
-0.8
-0.6
-0.4
-0.2
0
0.2
0.4
0.6
$!GlobalContour  2
  Var = |CFvar|
  ColorMapName = 'CfMap_DPW'
  DefNumLevels = 6
  Legend { Show = Yes IsVertical = Yes RowSpacing = 1.0 XYPos { X = 87 Y = 50 } Box { BoxType = None } AnchorAlignment = MiddleLeft }
  Legend { NumberTextShape{FontFamily = 'FreeSans'} NumberTextShape{SizeUnits = Point} NumberTextShape{Height = 14.4} }
  Legend { HeaderTextShape{FontFamily = 'FreeSans'} HeaderTextShape{SizeUnits = Point} HeaderTextShape{Height = 14.4} }
  ColorCutoff { RangeMin = 0.0 RangeMax = 1.0 }
  ColorMapFilter { ColorMapDistribution = Continuous ContinuousColor { CMin = 0 CMax = 0.005 } UseFastApproxContinuousFlood = Yes ReverseColorMap = No }

$!ContourLevels New
  ContourGroup = 2
  RawData
6
0
0.001
0.002
0.003
0.004
0.005

$!GlobalContour  3
  Var = |CFxvar|
  ColorMapName = 'CfMap_DPW'
  DefNumLevels = 8
  Legend { Show = Yes IsVertical = Yes RowSpacing = 1.0 XYPos { X = 87 Y = 50 } Box { BoxType = None } AnchorAlignment = MiddleLeft }
  Legend { NumberTextShape{FontFamily = 'FreeSans'} NumberTextShape{SizeUnits = Point} NumberTextShape{Height = 14.4} }
  Legend { HeaderTextShape{FontFamily = 'FreeSans'} HeaderTextShape{SizeUnits = Point} HeaderTextShape{Height = 14.4} }
  ColorCutoff { RangeMin = -1.0 RangeMax = 1.0 }
  ColorMapFilter { ColorMapDistribution = Continuous ContinuousColor { CMin = -0.002 CMax = 0.005 } UseFastApproxContinuousFlood = Yes ReverseColorMap = No }

$!ContourLevels New
  ContourGroup = 3
  RawData
8
-0.002
-0.001
0
0.001
0.002
0.003
0.004
0.005

$!GlobalThreeDVector
  UVar = |Uvar|
  VVar = |Vvar|
  WVar = |Wvar|
  RelativeLength = 150

$!IF "|PlotTime|" != ""
  $!GlobalTime
    SolutionTime = |PlotTime|
$!ENDIF

$!FieldMap  [|WingMaps|]
  Mesh { Color = Black }
  Contour
    {
    ContourType = BothLinesAndFlood
    LineContourGroup = 1
    FloodColoring = Group1
    Color = Custom2
    UseLightingEffect = No
    }
  Vector { Color = Black }
  Scatter { Color = Black }
  Shade { Color = Custom2 }
  EdgeLayer { Show = Yes Color = Black LineThickness = 0.1 }
  Points { PointsToPlot = SurfaceNodes }
  Surfaces { SurfacesToPlot = KPlanes IRange { Max = 1 } }
  VolumeMode { VolumeObjectsToPlot { ShowIsosurfaces = No ShowSlices = No ShowStreamtraces = No } }
  Effects { LightingEffect = Gouraud }

$!FieldLayers
  ShowMesh = No
  ShowContour = Yes
  ShowShade = Yes
  ShowEdge = No
$!StreamtraceLayers
  Show = Yes

$!FrameControl ActivateByNumber
  Frame = 1

$!GlobalThreeD
  AxisScaleFact { X = 1 Y = 1 Z = 1 }
  RotateOrigin { X = |RotX| Y = |RotY| Z = |RotZ| }
  LightSource
    {
    XYZDirection{ X = -0.2 Y = -0.2 Z = 0.8 }
    Intensity = 75
    BackgroundLight = 25
    IncludeSpecular = Yes
    SpecularIntensity = 40
    SpecularShininess = 60
    }
  LineLiftFraction = 0.2
  SymbolLiftFraction = 0.6
  VectorLiftFraction = 0.7
  NearPlaneFraction = 0.1

# Same for upper and lower surfaces because z is flipped
$!ThreeDView 
  PSIAngle   = 0
  ThetaAngle = -90
  AlphaAngle = 90
  ViewerPosition
    {
    X = |RotX|
    Y = |RotY|
    Z = |ViewZ|
    }
  ViewWidth = 1.18

$!PrintSetup Palette = Color
$!ExportSetup ExportFormat = PNG
$!ExportSetup ExportRegion = AllFrames
$!ExportSetup ImageWidth = |ImageWidth|
$!ExportSetup UseSuperSampleAntiAliasing = Yes
$!ExportSetup SuperSampleFactor = 3
$!ExportSetup ConvertTo256Colors = No

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Streamlines
$!IF |EnableStreamlines| == 1
   $!Streamtrace DeleteAll
  
   $!RESETVECTORLENGTH
   $!STREAMTRACELAYERS SHOW = YES
   $!STREAMTRACE RESETDELTATIME
   
   $!VarSet |StreamlineWidth| = ( 0.15* 8/ |FrameHeight| )
   $!VarSet |ArrowWidth|      = ( 1.5* 8/ |FrameHeight| )
   $!StreamAttributes LineThickness = |StreamlineWidth|
   $!StreamAttributes ArrowheadSize = |ArrowWidth|
   $!StreamAttributes AddArrows = No
$!ENDIF # Streamlines enabled?


#----------------------------------------------------------------------------------
# Tick through both surfaces
#----------------------------------------------------------------------------------
$!ACTIVEFIELDMAPS = [|WingMaps|]
$!LOOP 2
   $!VarSet |ViewIndex| = |Loop|
   
   $!IF |ViewIndex| == 1
       $!VarSet |TEC_View| = "WingUpper"
       $!VarSet |Surface_Text| = "Upper Surface"
   $!ELSEIF |ViewIndex| == 2
       $!VarSet |TEC_View| = "WingLower"
       $!VarSet |Surface_Text| = "Lower Surface"
      #$!AlterData
      #  Equation = 'V|Zvar| = -1 * V|Zvar|'
   $!ENDIF
   
   $!GlobalFrame
     FrameHeaderFormat = "<greek>a</greek>=|ALPHA|, C<sub>L</sub>=|CL|, C<sub>D</sub>=|CD|, C<sub>M</sub>=|CMy|, M=|MACH|, Re=|REYN|, |LOFTNAME|, |Surface_Text|"
     FrameHeaderHeight = 0.25
     UseThickerActiveFrameBorderOnScreen = No
   
   #-------------------
   $!IF |EnableStreamlines| == 1
      $!VarSet |NumSpots| = (|NumStreams| + 1 )  # Don't stick one right at the root or tip
      $!VarSet |StreamDy| = (|Span| / |NumSpots| )
      $!VarSet |StreamY|  = 0
      
      $!LOOP |NUMSTREAMS|
         $!ACTIVEFIELDMAPS = [|WingMaps|]
         
         # Make Y Slice
         $!VarSet |StreamY| = ( |StreamY| + |StreamDy| ) # This is a target number... exact values pulled later (StreamYActual)
         $!GLOBALTHREED SLICE { ORIGIN {Y=(|StreamY|)} NORMAL { X=0 Y=1 Z=0 }}
         $!CREATESLICEZONEFROMPLANE SLICESOURCE=SURFACEZONES
   
         $!ACTIVEFIELDMAPS = [|NUMZONES|] # Activate new slice zone only
         
         #----------------------------
         #Loop over nodes to find streamtrace seed point (extreme values of z)
         $!IF "|TEC_View|" == "WingUpper"
           #$!SYSTEM "printf '\nStreamline %i/%i... upper surface\n' |LOOP| |NUMSTREAMS|"
         $!ELSE
           #$!SYSTEM "printf '\nStreamline %i/%i... lower surface\n' |LOOP| |NUMSTREAMS|"
         $!ENDIF
         
         # Points of interest
         $!VarSet |TargetX1| = 0.20
         # X2 is Z/C max
         $!VarSet |TargetX3| = 0.70
         # XShock is slightly downstream of shock (max dCP/dx)
         
         # Get into the loop
         $!VarSet |X1| = -99999
         $!VarSet |Z2| = -99999
         $!VarSet |X3| =  99999
         $!VarSet |X4| =  99999
         $!VarSet |dCPShock| = -99999
         $!VarSet |dCFShock| = -99999
         
         $!LOOP |MaxI|
            # Find maximum z value in the slice (whether upper surface or upside down lower surface)
            $!GetFieldValue |CurrX|
              Zone = |NUMZONES|
              Var = 1
              Index = |Loop|
            
            $!GetFieldValue |CurrY|
              Zone = |NUMZONES|
              Var = 2
              Index = |Loop|
            
            $!GetFieldValue |CurrZ|
              Zone = |NUMZONES|
              Var = 3
              Index = |Loop|
            
            $!GetFieldValue |CurrDcp|
              Zone = |NUMZONES|
              Var = |dCPVarNum|
              Index = |Loop|
              
            $!GetFieldValue |CurrDcf|
              Zone = |NUMZONES|
              Var = |dCFVarNum|
              Index = |Loop|
            
            # Get streamtrace at X2
            $!IF |CurrZ| > |Z2|
               $!VarSet |X2| = |CurrX|
               $!VarSet |Y2| = |CurrY|
               $!VarSet |Z2| = |CurrZ|
              #$!SYSTEM "printf '(%.4f,%.4f,%.4f)...  MaxZ... %.5f\n' |CurrX| |CurrY| |CurrZ| |MaxZ|"
            $!ENDIF # Check if larger z than previously found
            
            # Get streamtrace at X1
            $!IF |CurrX| < |TargetX1|
               $!IF |CurrX| > |X1|
                  $!VarSet |X1| = |CurrX|
                  $!VarSet |Y1| = |CurrY|
                  $!VarSet |Z1| = |CurrZ|
               $!ENDIF
              #$!SYSTEM "printf '(%.4f,%.4f,%.4f)...\n' |X1| |Y2| |Z1|"
            $!ENDIF # Check if closer to X1 than before

            # Get streamtrace at X3
            $!IF |CurrX| > |TargetX3|
               $!IF |CurrX| < |X3|
                  $!VarSet |X3| = |CurrX|
                  $!VarSet |Y3| = |CurrY|
                  $!VarSet |Z3| = |CurrZ|
               $!ENDIF
              #$!SYSTEM "printf '(%.4f,%.4f,%.4f)...\n' |X1| |Y2| |Z1|"
            $!ENDIF # Check if closer to X3 than before
            
            # Get streamtrace at XShock... shock on the upper surface... if it's the LS, find it anyways, but don't make the streamline (further down in the macro)... X4 is slightly downstream from this point
            $!IF |CurrX| > |TargetX1|
               $!IF |CurrX| < 0.9
                  $!IF |CurrDcf| > |dCFShock|
            #     $!IF |CurrDcp| > |dCPShock|
                     $!VarSet |XShock| = |CurrX|
                     $!VarSet |YShock| = |CurrY|
                     $!VarSet |ZShock| = |CurrZ|
                     $!VarSet |dCPShock| = |CurrDcp|
                     $!VarSet |dCFShock| = |CurrDcf|
                  $!ENDIF
               $!ENDIF
            $!ENDIF
         $!ENDLOOP # Each index in the slice to find X1, X2, X3, and XShock
         
         # I have XShock... now find X4, which is slightly downstream
         $!LOOP |MaxI|
            # Find maximum z value in the slice (whether upper surface or upside down lower surface)
            $!GetFieldValue |CurrX|
              Zone = |NUMZONES|
              Var = 1
              Index = |Loop|
            $!GetFieldValue |CurrY|
              Zone = |NUMZONES|
              Var = 2
              Index = |Loop|
            $!GetFieldValue |CurrZ|
              Zone = |NUMZONES|
              Var = 3
              Index = |Loop|
            
            $!VarSet |X4Target| = ( |XShock| + 0.02 )
            $!IF |CurrX| > |X4Target|
               # Downstream of the shock
               $!IF |CurrX| < |X4|
                  # Closer to X4Target than previous value
                  $!VarSet |X4| = |CurrX|
                  $!VarSet |Y4| = |CurrY|
                  $!VarSet |Z4| = |CurrZ|
               $!ENDIF
            $!ENDIF
         $!ENDLOOP # Each index in the slice to find X4
         
         # Delete extracted slice zone
         $!DELETEZONES [|NUMZONES|]
         
         #----------------------------
         # Add StreamTrace at point found
         $!ACTIVEFIELDMAPS = [|WingMaps|]
         $!STREAMTRACE ADD
           STREAMTYPE = SURFACELINE
           STREAMDIRECTION = BOTH
           STARTPOS { X = |X1| Y = |Y1| Z = |Z1| }
         
         $!STREAMTRACE ADD
           STREAMTYPE = SURFACELINE
           STREAMDIRECTION = BOTH
           STARTPOS { X = |X2| Y = |Y2| Z = |Z2| }
        
         $!STREAMTRACE ADD
           STREAMTYPE = SURFACELINE
           STREAMDIRECTION = BOTH
           STARTPOS { X = |X3| Y = |Y3| Z = |Z3| }
        
         $!IF "|TEC_View|" == "WingUpper"
            # Add a streamtrace on the upper surface just downstream of the shock
            $!STREAMTRACE ADD
              STREAMTYPE = SURFACELINE
              STREAMDIRECTION = BOTH
              STARTPOS { X = |X4| Y = |Y4| Z = |Z4| }
         $!ENDIF
      $!ENDLOOP # Number of streamlines
   $!ENDIF # Enable streamlines or no?
   
   #----------------------------
   # Export everything... run the macro
   $!RUNMACROFUNCTION "ExportContours" ('Cp', |EnableStreamlines|,|ViewIndex|,|WingMaps|,'Custom9','Custom9')
   $!RUNMACROFUNCTION "ExportContours" ('Cf', |EnableStreamlines|,|ViewIndex|,|WingMaps|,'Custom9','Custom9')
   $!RUNMACROFUNCTION "ExportContours" ('Cfx',|EnableStreamlines|,|ViewIndex|,|WingMaps|,'Custom9','Custom9')
$!ENDLOOP # Go through each surface

$!GlobalFrame
  FrameHeaderFormat = "<greek>a</greek>=|ALPHA|, C<sub>L</sub>=|CL|, C<sub>D</sub>=|CD|, C<sub>M</sub>=|CMy|, M=|MACH|, Re=|REYN|, |LOFTNAME|"
  FrameHeaderHeight = 0.25
  UseThickerActiveFrameBorderOnScreen = No

