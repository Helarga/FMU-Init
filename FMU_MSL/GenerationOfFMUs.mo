within FMU_MSL;
model GenerationOfFMUs
  "Example to demonstrate variants to generate FMUs (Functional Mock-up Units)"
  extends Modelica.Icons.Example;

  Modelica.Blocks.Sources.Sine sine1(f=2, amplitude=1000)
    annotation (Placement(transformation(origin = {40, -40}, extent = {{-100, 40}, {-80, 60}})));
 DirectCapacity_me_FMU directCapacity_me_FMU annotation(
    Placement(transformation(origin = {6, 6}, extent = {{-10, -10}, {10, 10}})));
 InverseCapacity_me_FMU inverseCapacity_me_FMU annotation(
    Placement(transformation(origin = {54, 6}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(directCapacity_me_FMU.T, inverseCapacity_me_FMU.T) annotation(
    Line(points = {{18, 14}, {44, 14}}, color = {0, 0, 127}));
  connect(directCapacity_me_FMU.derT, inverseCapacity_me_FMU.derT) annotation(
    Line(points = {{18, 10}, {44, 10}}, color = {0, 0, 127}));
  connect(sine1.y, directCapacity_me_FMU.Q_flowDrive) annotation(
    Line(points = {{-39, 10}, {-4, 10}}, color = {0, 0, 127}));
 connect(inverseCapacity_me_FMU.Q_flow, directCapacity_me_FMU.Q_flow) annotation(
    Line(points = {{66, 14}, {82, 14}, {82, 40}, {-22, 40}, {-22, 14}, {-4, 14}}, color = {0, 0, 127}));
  annotation (experiment(StopTime=1, Interval=0.001), Documentation(info="<html>
<p>
This example demonstrates how to generate an input/output block (e.g. in form of an
FMU - <a href=\"https://fmi-standard.org\">Functional Mock-up Unit</a>) from various HeatTransfer components.
The goal is to export such an input/output block from Modelica and import
it in another modeling environment. The essential issue is that before
exporting it must be known in which way the component is utilized in the
target environment. Depending on the target usage, different flange variables
need to be in the interface with either input or output causality.
Note, this example model can be used to test the FMU export/import of a Modelica tool.
Just export the components marked in the icons as \"toFMU\" as FMUs and import
them back. The models should then still work and give the same results as a
pure Modelica model.
</p>

<p>
<strong>Connecting two masses</strong><br>
The upper part (DirectCapacity, InverseCapacity)
demonstrates how to export two heat capacitors and connect them
together in a target system. This requires that one of the capacitors
(here: DirectCapacity)
is defined to have states and the temperature and
derivative of temperature are provided in the interface.
The other capacitor (here: InverseCapacity) requires heat flow according
to the provided input temperature and derivative of temperature.
</p>

<p>
<strong>Connecting a conduction element that needs only temperature</strong><br>
The lower part (Conductor) demonstrates how to export a conduction element
that needs only temperatures for its conduction law and connect this
conduction law in a target system between two capacitors.
</p>
</html>"));
end GenerationOfFMUs;
