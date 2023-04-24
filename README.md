# Twerk Transitions

## Overview

Twerk Transitions is an open-source, free-to-use room transition library that uses [GMTwerk 2](https://github.com/dicksonlaw583/GMTwerk2) to animate its motions and fades.

## Requirements

- GameMaker Studio 2.3.7+
- [GMTwerk 2.1.0](https://github.com/dicksonlaw583/GMTwerk2/releases/tag/v2.1.0) or higher

## Installation

Get the current asset package and documentation from [the releases page](https://github.com/dicksonlaw583/TwerkTransitions/releases). Simply extract everything to your project, including the host object and all accompanying class definitions.

Once you install the package, you may optionally change the options in `__TWERK_TRANS_CONFIG__`.

## Quick Examples

### Go to the menu with a springy zooming effect
```
room_transition(rm_menu, tt_maximize, { scaleType: te_elastic_out });
```

### Go to the previous room with a smooth pushing effect
```
room_transition(room_previous(room), tt_push_right, { pushType: te_quintic_out });
```

### Go to the next room with a bouncy "trapdoor" effect
```
room_transition(room_next(room), tt_slide_in_vertical, { slideType: te_bounce_out });
```

