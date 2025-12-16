# Smart Contract Security CTF – Base Sepolia

Welcome to the hands-on Capture the Flag portion of the "Dependable Distributed Systems" workshop!

You've just learned about the most common smart contract vulnerabilities.  
Now it's time to exploit them live on **Base Sepolia** testnet.

### Challenges

1. **Vault** – Classic Reentrancy  
   Address: `0x198bd919126Ef47D5fD48B7eD9AE69Caaf186a60`  
   Goal: Drain the contract below 1 ETH to capture the flag (`solved = true`).

2. **ChangeOwner** – tx.origin Phishing  
   Address: `0x02815e0077C2b2D1f236b75039552e01457c85Cd`  
   Goal: Become owner and call `win()` by exploiting `tx.origin`.

3. **DonationChallenge** – Logic Flaw (Infinite Reward)  
   Address: `0x4F2557700117852414f559468bbA409df1b47469`  
   Goal: Drain all ETH from the contract.

4. **Lottery** – Severe Logic Flaw (110% Payout)  
   Address: `0x3390E6135A7d12A80d6B3CDaf702eC75dAFC77dd`  
   Goal: Profit from buying tickets and drawing → drain the entire balance.

### Rules & Tools
- Use **Remix IDE** + MetaMask (connected to Base Sepolia).
- Get free test ETH from Base Sepolia faucets.
- Write attack contracts in Remix, deploy them, and interact with the challenge addresses.
- First to set `solved = true` (or drain fully) wins bragging rights!

### Tips
- Read the source code carefully — the bugs are real-world patterns.
- Think like an attacker: How would you abuse the intended logic?
- Discuss with your neighbor — collaboration encouraged!

Good luck, future whitehats! 🏴‍☠️
