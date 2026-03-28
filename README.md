# Biometric Neural Sync — Cloud Run Lab

A real-time, AI-powered biometric authentication system built with Google Cloud Run, Gemini Live API, and Google Agent Development Kit (ADK).

## Overview

This project implements a gesture-based authentication system that uses a live webcam feed to detect hand gestures (finger counts 1–5) and verifies them using Google's Gemini Live multimodal AI model. The system streams video and audio in real time using WebSockets, processes the input through an AI agent, and grants access upon successful biometric verification.

## GCP Services Used

- **Cloud Run** — Hosts the containerized full-stack application
- **Vertex AI** — Provides access to the Gemini Live API
- **Cloud Build** — Builds and pushes the Docker container image
- **Artifact Registry** — Stores the container image

## Architecture

- **Frontend:** React app that captures live webcam and microphone input and streams it over WebSockets
- **Backend:** Python FastAPI server using Google ADK to manage the AI agent and session state
- **AI Model:** Gemini Live 2.5 Flash (native audio) via Vertex AI
- **Deployment:** Google Cloud Run (serverless, fully managed)

## How It Works

1. The React frontend opens a WebSocket connection to the FastAPI backend
2. Live video frames and audio are captured and sent over the WebSocket
3. The backend feeds the stream into the Gemini Live API via ADK
4. Gemini analyzes the video frames and counts the fingers visible
5. When a valid finger count (1–5) is detected, the AI calls the `report_digit` tool
6. The frontend receives the response and updates the UI
7. Once the full sequence is matched, **NEURAL SYNC COMPLETE** is displayed

## Key Concepts Learned

- **Cloud Run** — Deploying containerized applications as serverless services on GCP
- **WebSockets** — Full-duplex, real-time communication between browser and server
- **Multimodal AI** — Processing simultaneous video and audio streams with Gemini Live
- **ADK** — Building stateful AI agents with tool calling capability
- **Vertex AI** — Accessing Google's latest foundation models via GCP

## Live Demo

The application is deployed and accessible at:
https://biometric-scout-391497950600.us-central1.run.app
