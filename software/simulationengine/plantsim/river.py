
import component
import port
import fluid
import physics

class river(component.component):
    """ A pipe connected to the river, at some depth. """

    def __init__(self, depth_under_surface_m = 2.0, pipe_size_m2 = physics.large_pipe_size_m2, pipe_length_m = 20.0, river_temperature_C = 18.0):
        self.depth_under_surface_m = depth_under_surface_m

        self.river_water = fluid.fluid(1000, river_temperature_C, 0.01)

        pressure_Pa = physics.water_pressure(river_temperature_C, depth_under_surface_m)
        self._add_port(port.port("river", self.river_water, pipe_size_m2, pipe_length_m, 0, pressure_Pa))





