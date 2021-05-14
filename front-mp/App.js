import { StatusBar } from 'expo-status-bar';
import React, {useState} from 'react';
import Signin from './pages/Signin';



export default function App() {

const [nome, setNome] = useState('');
const [email, setEmail] = useState('');
const [senha, setSenha] = useState('');

  return (
    <>
      <Signin />
      <StatusBar style="light" />
    </>
  );
}


