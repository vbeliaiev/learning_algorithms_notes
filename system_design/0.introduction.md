### Requirements
- Functional: what system is supposed to do (e-commerce website should allow to browse products, add them to the cart, complete purchases ...)
- Non-Functional: how the system performs the task. (system property)
  -- Scalability
  -- Performance
  -- Availability
  -- Security

Need to integrate both requirements. Balance both types.

In system design Interviews:

1) Clarify Requirements
2) Priroitize (not all equally important)
3) Trade-offs (компромис) For example optimized system can be fast on read but slower on write operations
4) Use real world examples
5) Balance


### Back-of-the-Envelope Estimations (Приблизительные оценки)

Reasons:
1) Indicates System Scalability
2) Validate proposed solutions
3) Identify bottlenecks
4) Demonstrate thought process
5) Communicate effectively (explain desing choices to the interviewer)
6) Quick Decision Making (ability to make swift(fast) estimations)


### Estimatoon Techniques

1) Rue of thumb (приблизительное правило)
- based on experience and observations. For example estimating the user can generate 1MB of data per day

2) Approximation
- for easier counting. Example 1_000 users ~= 1_024 users

3) Breakdown and aggregation

4) Sainty check (быстрая проверка на адекватность)


### Types of Estimations in System Design interviews

1) Load estimations (nb request/second, data volume, user traffic)

To estimate load:
- 100 million DAU (daily active users) * 10 posts/user = 1 billion posts/day
- 1 billion posts/day / 86_400 seconds/day ~= 11_574 requiest / second

2) Storate estimation
- 500 million users * 2 photos/user * 2mb/photo = 2_000_000_000 mb/day

3) Bandwidth estimation (пропускная способность): Determine network bandwidth to support expected traffic and data transfer
- 10 million users * 4 Mbps = 40,000,000 Mbps

4) Latency estimation: response time and latency for the components
- 50 ms + 100 ms + 200 ms = 350 ms
or in parallel
- max(50 ms, 100 ms, 200 ms) = 200 ms

5) Resource estimation: Nb CPU, memory to load and maintain desired performance
Web app receives 10k request/second, each request requiring 10ms of CPU time. Estimate nb of CPU/
- Calculate total CPU time per second
10_000 requests/second * 10 ms/request = 100_000 ms/second
- Assuming each cpu can handle 1_000 ms processing per second
100_00 ms/second / 1_000 ms/core = 100 cores

### Process:
- Understantd the scope: Clarify the scale of the problem nb users, how much data etc
- Use Simple Math: Basic arithmetic to estimate scale of data and resourves
- Round Numbers for Simplicity
- Be logical and Reasonable: Ensure estimation make sense

### System Design Examples

1) Designing a messaging service (similar to whats app)

- Nb of users
- Messages per user per day
- Message size
- Storage requirements
- Bandwidth requirements

2) Video streaming platform

- Nb of users
- Concurrent users
- Video size and bitrate
- Storage requirements
- Bandwidth requirements


### Tips For Successfull Estimations in Interviews
1. Break down the problem
Split to smaller manageable components

2. Use reasonable assumptions

3. Leverage your experience

4. Be prepared to ajust your estimations

5. Don't forget to ask Clarifying Questions

6. Communicatie your thougth process


### Things to avoid !

1) Don't ignore the Requirements
- Need to ask questions to clarify requirements
- Don't oversimplify the problem or ignore complexites

2) Don't Dive into Details Too Soon
- Start from high-level and move to low level
- Focus first on the overall architecture

3) Don't Stick Rigidly to One Idea
- Be flexible
- Do not ignore hints

4) Don't overlook Trade-offs (компромиссы)
- Every decision has trade-offs. Discuss it to show understanding.

5) Don't Neglect Non-Functional Requirements
- Don't forget to focus on scalability and reliability
- Real world constraints

6) Don't Under Communicate
- Poor Ecplanation
- Not Engaging the interviewer: This is a dialogue, not monologue. Ask questions, receive feedback.

7) Don't Be Overconfident or Arrogant
- Overconfident can lead to dismissing valuable feedback
-  Not Acknowledging What You Don't Know: It's okay to not know everything.


### Conclusion
A system design interview is not just about getting the right answer. It's about demonstrating your problem-solving approach, your ability to adapt, and how you communicate and collaborate. Avoiding these pitfalls can help you present yourself as a well-rounded candidate capable of handling the complexities of real-world system design.