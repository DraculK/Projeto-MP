import { StatusBar } from 'expo-status-bar';
import React, {useState} from 'react';
import { View } from 'react-native';
import Signin from './pages/Signin';
import { ButtonSubmit, CadastroSubmit, TextSubmit } from './pages/Signin/styles';
import {TextInput,container} from 'react-native';



export default function App() {

const [nome, setNome] = useState('');
const [email, setEmail] = useState('');
const [senha, setSenha] = useState('');

  return (
    
    <>
      <Signin />
      <StatusBar style="light" />
      
      
      <CadastroSubmit>
        <ButtonSubmit>
        <TextSubmit>
          Cadastro ------>  ------>  
        </TextSubmit>
        </ButtonSubmit>

        <TextInput placeholder="Seu nome" style={StyleSheet.TextInput}onChangeText={text=>setNome(text)}/>
        <TextInput placeholder="Seu E-mail" style={StyleSheet.TextInput}onChangeText={text=>setEmail(text)}/>
        <TextInput secureTextEntry = {true}placeholder="Cria uma senha" style={StyleSheet.TextInput}onChangeText={text=>setSenha(text)}/>
        <TextInput secureTextEntry = {true}placeholder="confirme sua senha" style={StyleSheet.TextInput}onChangeText={text=>setSenha(text)}/>


      </CadastroSubmit>





    </>

  );


  const styles  = StyleSheet.creat({
container:{
    flex:1,
    backgroundColor: '#27282D',
    alignItems: 'center',
    justifyContent: 'center',
},

TextInput:{
with: '100%',
height:40,
backgroundColor:'white',
borderRadius:20,
paddingLeft:10,
marginBottom:10,
}




  });

}


