from enum import Enum
from typing import Any, Optional

from flet_core.constrained_control import ConstrainedControl
from flet_core.control import OptionalNumber
from flet_core.types import DurationValue


class SpinkitType(Enum):
    ROTATING_CIRCLE = "rotatingCircle"
    FOLDING_CUBE = "foldingCube"
    DOUBLE_BOUNCE = "doubleBounce"
    WAVE = "wave"
    WANDERING_CUBES = "wanderingCubes"
    CIRCLE = "circle"
    FADING_CIRCLE = "fadingCircle"
    DANCING_SQUARE = "dancingSquare"
    CHASING_DOTS = "chasingDots"
    THREE_BOUNCE = "threeBounce"
    FADING_FOUR = "fadingFour"
    PUMPING_HEART = "pumpingHeart"


class Spinkit(ConstrainedControl):
    """
    Spinkit Control.
    """

    def __init__(
        self,
        #
        # Spinkit specific
        #
        spinkit_type: SpinkitType = SpinkitType.PUMPING_HEART,
        color: Optional[str] = None,
        size: OptionalNumber = None,
        duration: DurationValue = None,
        #
        # Control
        #
        opacity: OptionalNumber = None,
        tooltip: Optional[str] = None,
        visible: Optional[bool] = None,
        data: Any = None,
        #
        # ConstrainedControl
        #
        left: OptionalNumber = None,
        top: OptionalNumber = None,
        right: OptionalNumber = None,
        bottom: OptionalNumber = None,
    ):
        ConstrainedControl.__init__(
            self,
            tooltip=tooltip,
            opacity=opacity,
            visible=visible,
            data=data,
            left=left,
            top=top,
            right=right,
            bottom=bottom,
        )

        self.color = color
        self.size = size
        self.spinkit_type = spinkit_type
        self.duration = duration

    def _get_control_name(self):
        return "spinkit"

    def before_update(self):
        super().before_update()
        self._set_attr("duration", self.__duration)

    # color
    @property
    def color(self) -> Optional[str]:
        return self._get_attr("color")

    @color.setter
    def color(self, value: Optional[str]):
        self._set_attr("color", value)

    # size
    @property
    def size(self) -> OptionalNumber:
        return self._get_attr("size", data_type="float")

    @size.setter
    def size(self, value: OptionalNumber):
        self._set_attr("size", value)

    # spinkit_type
    @property
    def spinkit_type(self) -> SpinkitType:
        return self.__spinkit_type

    @spinkit_type.setter
    def spinkit_type(self, value: SpinkitType):
        self.__spinkit_type = value
        self._set_attr(
            "spinkitType", value.value if isinstance(value, SpinkitType) else value
        )

    # duration
    @property
    def duration(self) -> DurationValue:
        return self.__duration

    @duration.setter
    def duration(self, value: DurationValue):
        self.__duration = value
