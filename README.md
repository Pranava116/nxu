
**NXU - Not eXactly Unix**

Rethinking operating systems from first principles.

NXU is an open-source research operating system for ARM64 exploring how modern computing could be designed if we started today.

Rather than accepting decades of existing design decisions, NXU begins by asking why each subsystem exists before deciding how it should be implemented.

The objective is not to replace existing operating systems.

The objective is to better understand them, challenge assumptions where appropriate, and build a system through careful engineering, openness, and continuous learning.

⸻

**Philosophy**

Every subsystem in NXU starts with one question:

What problem are we solving?

Instead of asking:

“How does Linux implement this?”

NXU asks:

“Why is this subsystem necessary? What constraints created it? Is there a simpler or more appropriate design for NXU?”

Sometimes the answer will be identical to existing operating systems.

Sometimes it won’t.

Either outcome is valuable.

Engineering decisions should be driven by understanding—not imitation.

⸻

**Engineering Principles**

* First-principles systems engineering
* Privacy-first computing
* Capability-based security exploration
* Simplicity over unnecessary complexity
* Transparent design decisions
* Learn in public
* Build with the community

⸻

**Project Goals**

NXU aims to explore:

* Modern operating system architecture
* Secure and understandable kernel design
* Capability-oriented security models
* Privacy-conscious networking concepts
* Modular subsystem design
* Long-term maintainability
* Open engineering discussions

This is a long-term research project focused on learning, experimentation, and thoughtful implementation.

⸻

**Current Status**

Kernel Foundation

Completed

* ✅ ARM64 boot sequence
* ✅ Kernel entry point
* ✅ Linker configuration
* ✅ PL011 UART driver
* ✅ Serial console output
* ✅ Exception vector setup

Currently Working On

* 🚧 Generic Timer
* 🚧 Timer Interrupts
* 🚧 Tick Counter

⸻

**Roadmap**

Phase 1 — Foundation

* Timer Interrupts
* Physical Memory Manager
* Kernel Heap
* Basic Debug Infrastructure

⸻

Phase 2 — Core Kernel

* Scheduler
* Virtual Memory
* Process Management
* System Calls

⸻

Phase 3 — System Services

* Filesystem
* Userspace
* ELF Loader

⸻

Phase 4 — Networking

* Network Stack
* Capability-based Networking Research
* Secure Communication

⸻

Phase 5 — Developer Platform

* SDK
* Documentation
* Testing Infrastructure
* Hardware Support

⸻

**Current Focus**

The immediate objective is simple:

Build a stable kernel foundation before introducing additional complexity.

Each subsystem is designed, implemented, documented, and understood before moving to the next milestone.

Progress is intentionally incremental.

⸻

**Repository Structure**

boot/          Boot process
kernel/        Core kernel
drivers/       Hardware drivers
include/       Kernel headers
docs/          Technical documentation
tools/         Development tools

⸻

**Documentation**

Every subsystem should answer four questions:

1. Why does it exist?
2. What problem does it solve?
3. How does NXU implement it?
4. What improvements are planned?

Documentation is considered part of the implementation.

⸻

**Contributing**

NXU welcomes contributors who enjoy learning.

You do not need prior kernel development experience.

Contributions are welcome in areas such as:

* Documentation
* Architecture discussions
* Kernel development
* Driver development
* Testing
* Tooling
* Design reviews

Curiosity, thoughtful discussion, and respectful collaboration are valued more than experience.

⸻

**Project Status**

NXU is an early-stage research operating system under active development.

Interfaces, architecture, and implementation details may evolve as understanding improves.

This repository documents that journey openly.

⸻

**Vision**

Computing has evolved through decades of engineering decisions.

NXU exists to revisit those decisions from first principles.

Not to reject the past.

But to understand it deeply enough to build thoughtfully for the future.

⸻

**Founder**

Alexander

Founder, NXU Project

Building in public.

Learning in public.

Engineering from first principles.

⸻

*“Reality defines the constraints. Engineering designs the solution.”