# **Progetto Tower Defense**

## **1. Introduzione**
In questo progetto, ho sviluppato un gioco di tipo **Tower Defense** utilizzando il linguaggio di programmazione **Processing**. L'obiettivo è difendere una base dalla "fuga" di nemici, posizionando torri che sparano automaticamente per fermarli. Ogni nemico ha caratteristiche uniche come velocità e salute, mentre il giocatore può posizionare torri per ostacolare il loro cammino.

## **2. Obiettivi del Progetto**
- Creare un gioco interattivo di tipo **Tower Defense**.
- Implementare **diverse tipologie di torri** con caratteristiche uniche.
- Gestire la **generazione e il movimento dei nemici** lungo un percorso.
- Implementare un sistema di **monete e vite** per il giocatore.
- Sviluppare la logica di gioco, inclusi gli aggiornamenti delle vite e dei nemici.
- Utilizzare un sistema di **griglia** per il posizionamento delle torri.

## **3. Descrizione del Funzionamento**
Il gioco si basa su torri che devono fermare i nemici lungo un percorso. I nemici si spostano automaticamente lungo il percorso, e ogni volta che un nemico raggiunge la fine, il giocatore perde una vita. Se un nemico viene distrutto, il giocatore guadagna monete, che possono essere usate per acquistare altre torri.

### **Componenti principali**:
- **Nemici**: Esistono vari tipi di nemici (normali, veloci e corazzati) che differiscono per velocità e salute.
- **Torri**: Ogni torre ha caratteristiche differenti, come torri normali, veloci e a lunga gittata, ognuna con un costo di acquisto e una portata specifica.
- **Percorso**: I nemici seguono un percorso che viene generato casualmente all'inizio del gioco.

## **4. Struttura del Codice**
Il codice è suddiviso in diverse classi per gestire i vari aspetti del gioco:
- **Enemy**: Gestisce il movimento dei nemici e la loro visualizzazione.
- **Tower**: Gestisce le torri, il loro posizionamento sulla griglia, la portata e il danneggiamento dei nemici.
- **Path**: Gestisce il percorso che i nemici seguono e la sua visualizzazione.
- **Main**: Gestisce il ciclo principale del gioco, il controllo dell'input dell'utente (come il clic per posizionare torri), e l'aggiornamento dello stato del gioco.

## **5. Tecnologie Utilizzate**
- **Linguaggio di Programmazione**: **Processing** (basato su Java), ideale per la creazione di applicazioni grafiche e interattive.
- **Ambiente di Sviluppo**: **Processing IDE**, che semplifica la creazione di applicazioni grafiche.

## **6. Funzionalità Implementate**
- **Generazione dei nemici**: I nemici vengono creati dinamicamente con caratteristiche diverse (velocità e salute).
- **Posizionamento delle torri**: Il giocatore può scegliere il tipo di torre e posizionarla sulla griglia.
- **Sistema di monete e vite**: Il giocatore guadagna monete sconfiggendo i nemici e perde vite quando i nemici arrivano alla fine del percorso.
- **Interfaccia grafica**: La visualizzazione della griglia, delle torri, dei nemici, delle vite e delle monete.

## **7. Miglioramenti Futuri**
- **Nuovi tipi di torri**: Come torri con attacchi a lunga gittata, torri che rallentano i nemici, ecc.
- **Aggiungere livelli**: Un sistema di livelli per rendere il gioco sempre più impegnativo.
- **Effetti sonori e musica**: Migliorare l'esperienza utente con suoni e musiche di sottofondo.

## **8. Conclusioni**
Questo progetto mi ha permesso di esplorare e approfondire concetti di programmazione orientata agli oggetti, gestione degli eventi e progettazione di interfacce grafiche. Ho imparato come strutturare un gioco semplice, gestire la logica dei nemici e delle torri, e creare un'esperienza di gioco interattiva.
