import styled from 'styled-components/native';


export const KeyboardView = styled.KeyboardAvoidingView`
flex: 1;
align-items: center;
justify-content: center; 
background-color: #000;
` 

export const Container = styled.View`
flex: 1;
justify-content: center;
align-items: center;
padding-bottom: 30px;
width: 90%
`


export const Title = styled.Text`
color: #fff;
font-size:26px;
font-weight: 700;
margin-bottom: 29px; 
`

export const Input = styled.TextInput`
border:2px solid #13E6B5;
margin-bottom: 29px;
padding: 15px 20px;
color: #fff;
font-size: 20px;
border-radius: 9px; 
width: 90%
`

export const ButtonSubmit = styled.TouchableOpacity `
background-color:  #120a8f;
border-radius: 9px; 
width: 30% 
padding: 15px 20px;
justify-content: center;
aling-items: center;
`

export const TextSubmit = styled.Text`
color: #fff;
justify-content: center;
font-size:20px;
font-weight: bold;
`