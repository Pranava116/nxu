

**NXU Not eXactly Unix**

Rethinking operating systems from first # NXU

An open-source research operating system for ARM64 exploring first-principles systems engineering, privacy-first computing, and capability-based security.

Our goal isn’t to replace existing operating systems. Our goal is to question long-standing assumptions, understand the fundamental constraints of computing, and build a privacy-first, security-first system through thoughtful engineering.

⸻

**Philosophy**

Every subsystem in NXU begins with a simple question:

Why does this exist?

Instead of asking:

“How does another operating system implement this?”

we ask:

“What problem is this subsystem solving, and what is the best design for NXU?”

This philosophy guides every engineering decision.

⸻

**Core Principles**

* First-principles engineering
* Privacy-first architecture
* Capability-based security exploration
* Simplicity over unnecessary complexity
* Open development
* Transparent design decisions
* Learn in public

⸻

**Current Status**

Boot

* ✅ ARM64 boot sequence
* ✅ Kernel entry point
* ✅ Linker configuration

Hardware

* ✅ PL011 UART driver
* ✅ Serial console output
* ✅ Exception vector setup

In Progress

* 🚧 Generic Timer
* 🚧 Timer Interrupts
* 🚧 Tick Counter

⸻

**Upcoming Milestones**

Phase 1 — Kernel Foundation

* Timer Interrupts
* Physical Memory Manager
* Basic Kernel Heap

Phase 2 — Core Kernel

* Scheduler
* Virtual Memory
* Process Management

Phase 3 — System Services

* Filesystem
* Userspace
* System Calls

Phase 4 — Networking

* Network Stack
* Capability-based Networking
* Secure Communication

⸻

**Why NXU?**

Modern operating systems have evolved over decades to support countless hardware platforms and workloads.

NXU is an opportunity to revisit operating system design from first principles, studying every subsystem before deciding how it should exist.

Sometimes that journey will lead to the same solutions used today.

Sometimes it won’t.

Both outcomes are valuable.

⸻

**Contributing**

NXU welcomes people who enjoy learning.

You don’t have to be a kernel expert.

Contributions are welcome in:

* Documentation
* Architecture discussions
* Kernel development
* Testing
* Tooling
* Design reviews

Great systems are built by communities—not individuals.

⸻

**Project Status**

NXU is currently an early-stage research project under active development.

Expect frequent changes as ideas evolve and implementations improve.

⸻

Founder

**Alexander**

Founder, NXU Project

Building in public.
Learning in public.
Engineering from first principles