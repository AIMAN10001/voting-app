import React, { useState, useEffect, useContext } from "react";
import Image from "next/image";
import Countdown from "react-countdown";

// Internal import
import { VotingContext } from "../context/Voter";
import styles from "../styles/index.module.css"; //  "styles" instead of "Style"
import Card from "../components/card/card";
import images from "../assets/candidate-1.jpg";

const Index = () => {
  const {
    getNewCandidate,
    candidateArray,
    giveVote,
    currentAccount,
    checkIfWalletIsConnected,
    candidateLength,
    voterLength,
    getAllVoterData,
  } = useContext(VotingContext);

  useEffect(() => {
    checkIfWalletIsConnected();
    getAllVoterData();
  }, []);

  return (
    <div className={styles.home}>
      {currentAccount && (
        <div className={styles.winner}>
          <div className={styles.winner_info}>
            <div className={styles.candidate_list}>
              <p>
                No Candidate: <span>{candidateLength}</span>
              </p>
            </div>
            <div className={styles.candidate_list}>
              <p>
                No Voter: <span>{voterLength}</span>
              </p>
            </div>
          </div>
          <div className={styles.winner_message}>
            <small>
              <Countdown date={Date.now() + 10000000} />
            </small>
          </div>
        </div>
      )}

      <Card candidateArray={candidateArray} giveVote={giveVote} />
    </div>
  );
};

export default Index;
