![logo](https://github.com/AIMAN10001/AIMAN10001/blob/main/White%20Minimalist%20Profile%20LinkedIn%20Banner.png)
<h1 align="center">Decentralized Voting App</h1>

<p align="center">
  <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/solidity/solidity-original.svg" alt="Solidity" width="40" height="40"/>
  <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/javascript/javascript-original.svg" alt="JavaScript" width="40" height="40"/>
  <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/react/react-original-wordmark.svg" alt="React" width="40" height="40"/>
  <img src="https://cdn.worldvectorlogo.com/logos/nextjs-2.svg" alt="Next.js" width="40" height="40"/>
  <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/html5/html5-original-wordmark.svg" alt="HTML5" width="40" height="40"/>
  <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/css3/css3-original-wordmark.svg" alt="CSS3" width="40" height="40"/>
  <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/nodejs/nodejs-original-wordmark.svg" alt="Node.js" width="40" height="40"/>
</p>

<h2 align="center">Overview</h2>
<p align="center">This decentralized voting app is developed using smart contracts.</p>
<h4 align="center">Responsive for Mobile, Tablet and Laptops</h4>

<h2 align="center">Functionality</h2>

- Creating a voter by paying with Metamask
- Creating a candidate by paying with Metamask
- Uploading files to the IPFS server using Pinata
- Casting votes
- Metamask integration for creating candidates, voters, and casting votes
- Automatic selection of the winner based on the most votes
- and many more features...

<h2 align="center">Getting Started</h2>


1. **Restart:** Delete Artifacts, Cache, Create.json in Context, after deploying deploy.js move Create.json from artifact to context file

2. Open terminal:

   ```bash
   git clone https://github.com/AIMAN10001/voting-app
   cd voting-app
   npx hardhat node
   npx hardhat run --network localhost scripts/deploy.js
   npm run dev
