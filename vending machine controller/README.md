# Vending Machine Controller Using Verilog

## Overview

This project implements a simple **Vending Machine Controller** using Verilog HDL.

The vending machine has an item price of **15 units** and accepts two types of coins:

* 5-unit coin
* 10-unit coin

When the inserted amount reaches or exceeds 15 units, the machine dispenses the item.

If the inserted amount is greater than 15 units, the machine also indicates that change should be returned.

## Specifications

| Parameter       | Value    |
| --------------- | -------- |
| Item Price      | 15 units |
| Accepted Coin 1 | 5 units  |
| Accepted Coin 2 | 10 units |
| Output 1        | Dispense |
| Output 2        | Change   |

## Block Diagram

```text
       +---------+
5 Coin |         |
------>|         |
       |         |----> Dispense
10 Coin| Vending |
------>| Machine |----> Change
       |         |
 Clock |         |
------>|         |
Reset  |         |
------>|         |
       +---------+
```

## Operation

The controller keeps track of the amount inserted.

### Example 1

Insert 5 units:

```text
Amount = 5
Dispense = 0
```

Insert another 10 units:

```text
Amount = 5 + 10 = 15
Dispense = 1
Change = 0
```

### Example 2

Insert 10 units:

```text
Amount = 10
```

Insert another 10 units:

```text
Amount = 20
Dispense = 1
Change = 1
```

The extra 5 units are returned as change.

## Truth Table

| Coin | Current Amount | Result            |
| ---- | -------------: | ----------------- |
| None |              0 | No dispense       |
| 5    |              0 | Amount = 5        |
| 10   |              0 | Amount = 10       |
| 5    |             10 | Dispense          |
| 10   |              5 | Dispense          |
| 10   |             10 | Dispense + Change |

## Project Structure

```text
vending-machine-project/
├── README.md
├── vending_machine.v
└── vending_machine_tb.v
```

### `vending_machine.v`

Contains the RTL implementation of the vending machine controller.

### `vending_machine_tb.v`

Contains the testbench used to verify different coin combinations.

## Simulation

The project can be simulated using:

* Icarus Verilog
* ModelSim
* QuestaSim
* Vivado

### Compile

```bash
iverilog -o vending_sim vending_machine.v vending_machine_tb.v
```

### Run

```bash
vvp vending_sim
```

## Expected Output

For an item costing 15 units:

### 5 + 10

```text
Total = 15
Dispense = 1
Change = 0
```

### 10 + 10

```text
Total = 20
Dispense = 1
Change = 1
```

Expected results:

```text
Coins: 5 + 10
Dispense = 1
Change   = 0

Coins: 10 + 10
Dispense = 1
Change   = 1
```

## Result

The vending machine controller successfully detects when the inserted amount reaches the required item price.

The simulation verifies that:

* The item is dispensed when the total reaches 15 units.
* No item is dispensed when insufficient money is inserted.
* Change is indicated when more than 15 units are inserted.

## Applications

Vending machine controllers demonstrate concepts used in:

* Finite State Machines
* Digital control systems
* FPGA design
* Embedded systems
* Automated payment systems
* Digital electronics

## Future Improvements

The project can be extended with:

* Multiple products
* Different product prices
* Coin return functionality
* Product selection buttons
* Seven-segment display
* Inventory management
* Cancel/refund button

## Conclusion

This project demonstrates the design and verification of a basic vending machine controller using Verilog HDL. It is a useful FPGA and digital-design project for learning state-based control and RTL simulation.
