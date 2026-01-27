# SystemVerilog Design and Verification Labs

This repository contains a comprehensive set of SystemVerilog labs covering digital design, verification methodologies, and advanced SystemVerilog features. The labs progress from basic RTL design to advanced verification concepts including UVM foundations.

## Course Overview

**Course:** SystemVerilog Design and Verification  
**Version:** 21.10  
**Tool:** Cadence Xcelium Simulator

## Lab Structure

Each lab directory contains:
- Source files (`.sv`)
- Test benches (`*_test.sv`)
- Setup scripts (`setupX.bash`, `setupX.csh`)
- Simulation logs and databases

## Labs Overview

### **Part I: RTL Design Fundamentals**

#### **Lab 01 - Register Design** (`lab01-reg`)
- **Objective:** Design and verify a basic register module
- **Files:** `register.sv`, `register_test.sv`
- **Concepts:** Basic SystemVerilog syntax, always blocks, clocking

#### **Lab 02 - Multiplexer Design** (`lab02-mux`)
- **Objective:** Implement a scalable multiplexer
- **Files:** `scale_mux.sv`, `scale_mux_test.sv`
- **Concepts:** Parameterized modules, case statements, combinational logic

#### **Lab 03 - Counter Design** (`lab03-count`)
- **Objective:** Design a configurable counter
- **Files:** `counter.sv`, `counter_test.sv`
- **Concepts:** Sequential logic, reset handling, counting mechanisms

#### **Lab 04 - Control Logic** (`lab04-ctrl`)
- **Objective:** Implement control logic with pattern files
- **Files:** `control.sv`, `control_test.sv`, `typedefs.sv`, `stimulus.pat`, `response.pat`
- **Concepts:** State machines, typedef usage, file I/O

#### **Lab 05 - ALU Design** (`lab05-alu`)
- **Objective:** Design an Arithmetic Logic Unit
- **Files:** `alu.sv`, `alu_test.sv`, `typedefs.sv`
- **Concepts:** Arithmetic operations, logic operations, operation encoding

#### **Lab 06 - Memory Design** (`lab06-mem`)
- **Objective:** Implement memory module with hierarchical design
- **Files:** `mem.sv`, `mem_test.sv`, `top.sv`
- **Concepts:** Memory modeling, hierarchical design, module instantiation

### **Part II: Advanced RTL and Interfaces**

#### **Lab 07 - Interfaces** (`lab07-intf`)
- **Objective:** Learn SystemVerilog interfaces and modports
- **Files:** `mem.sv`, `mem_intf.sv`, `mem_test.sv`, `top.sv`
- **Concepts:** Interface declaration, modports, clocking blocks

#### **Lab 08 - CPU Integration** (`lab08-cpu`)
- **Objective:** Integrate all components into a simple CPU
- **Files:** `cpu.sv`, `cpu_test.sv`, `alu.sv`, `control.sv`, `counter.sv`, `mem.sv`, `register.sv`, `scale_mux.sv`, `typedefs.sv`
- **Concepts:** System integration, debugging, file lists

### **Part III: Verification Fundamentals**

#### **Lab 09 - Clocking Blocks** (`lab09-cb`)
- **Objective:** Master clocking blocks and synchronization
- **Files:** `flipflop.sv`, `flipflop_test.sv`
- **Concepts:** Clocking blocks, synchronous verification, timing control

#### **Lab 10 - Randomization** (`lab10-memrnd`)
- **Objective:** Implement constrained random verification
- **Files:** `mem.sv`, `mem_intf.sv`, `mem_test.sv`, `top.sv`
- **Concepts:** Random stimulus, constraints, randomization methods

### **Part IV: Object-Oriented Programming**

#### **Lab 11 - Classes and Constructors** (`lab11-countclass`)
- **Objective:** Learn SystemVerilog classes and OOP concepts
- **Files:** `constructor.sv`, `counter.sv`, `counter_limits.sv`, `derived_class.sv`, `roll_over_under.sv`
- **Concepts:** Class definition, constructors, inheritance, polymorphism

#### **Lab 12 - Polymorphism** (`lab12_polymorph`)
- **Objective:** Advanced OOP with polymorphism
- **Concepts:** Virtual methods, dynamic binding, abstract classes

#### **Lab 13 - Memory Classes** (`lab13-memclass`)
- **Objective:** Apply OOP to memory verification
- **Concepts:** Verification components as classes, encapsulation

#### **Lab 14 - Virtual Interfaces** (`lab14-memvif`)
- **Objective:** Use virtual interfaces in verification
- **Concepts:** Virtual interfaces, dynamic interface handling

### **Part V: Coverage and Assertions**

#### **Lab 15 - Memory Coverage** (`lab15-memcov`)
- **Objective:** Implement functional coverage for memory
- **Concepts:** Covergroups, coverpoints, cross coverage

#### **Lab 16 - ALU Coverage** (`lab16-alucov`)
- **Objective:** Advanced coverage techniques for ALU
- **Concepts:** Coverage bins, coverage options, coverage analysis

#### **Lab 17 - Memory Arrays** (`lab17-memarr`)
- **Objective:** Work with dynamic arrays and queues
- **Concepts:** Dynamic arrays, associative arrays, queues

### **Part VI: SystemVerilog Assertions (SVA)**

#### **Lab 18 - SVA Multiplexer** (`lab18-svamux`)
- **Objective:** Basic SystemVerilog assertions
- **Files:** `mux.sv`, `mux_test.sv`
- **Concepts:** Immediate assertions, concurrent assertions, property declaration

#### **Lab 19 - SVA Sequences** (`lab19-svaseq`)
- **Objective:** Advanced assertion sequences
- **Files:** `seqtest.sv`
- **Concepts:** Sequence declaration, temporal operators, implication

### **Part VII: Advanced Features**

#### **Lab 20 - DPI (Direct Programming Interface)** (`lab20-simpledpi`)
- **Objective:** Interface with C code using DPI
- **Files:** `math.sv`, `stdlibs.c`, `stdlibs_compile`
- **Concepts:** DPI-C, foreign function interface, C integration

#### **Lab 21 - Mailbox Communication** (`lab21-mailbox`)
- **Objective:** Inter-process communication using mailboxes
- **Files:** `ex_trans_pkg.sv`, `mailbox_consumer_m.sv`, `mailbox_if.sv`, `mailbox_producer_m.sv`, `mailbox_top_m.sv`
- **Concepts:** Mailbox, producer-consumer pattern, synchronization

#### **Lab 22 - Semaphores** (`lab22-semaphore`)
- **Objective:** Resource management with semaphores
- **Files:** `semaphore_m.sv`
- **Concepts:** Semaphore, resource allocation, mutual exclusion

#### **Lab 23 - Events** (`lab23-event`)
- **Objective:** Event-driven programming
- **Files:** `event_m_1.sv`
- **Concepts:** Events, wait statements, event triggering

## Getting Started

### Prerequisites
- Cadence Xcelium Simulator
- Basic knowledge of digital design
- Familiarity with Verilog/SystemVerilog syntax

### Running a Lab

1. Navigate to the desired lab directory:
   