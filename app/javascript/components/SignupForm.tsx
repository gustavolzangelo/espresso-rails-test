import React from "react";
import { useForm, Controller } from "react-hook-form";
import {
  Box,
  Button,
  TextField,
  Typography,
  Container,
  Paper,
} from "@mui/material";
import { z } from "zod";
import { zodResolver } from "@hookform/resolvers/zod";

const signupSchema = z.object({
  name: z.string().min(1, "Nome é obrigatório"),
  email: z.string().min(1, "Email é obrigatório").email("Email inválido"),
  password: z.string().min(8, "A senha deve ter pelo menos 8 caracteres"),
  companyName: z.string().min(1, "Nome da empresa é obrigatório"),
  cnpj: z.string().length(14, "O CNPJ deve ter exatamente 14 dígitos"),
});

type TSignupFormInput = z.infer<typeof signupSchema>;

const SignupForm: React.FC = () => {
  const {
    handleSubmit,
    control,
    formState: { errors },
  } = useForm<TSignupFormInput>({
    resolver: zodResolver(signupSchema),
    mode: "onBlur",
  });

  const onSubmit = (data: TSignupFormInput) => {
    console.log(data);
  };

  return (
    <Container style={{ marginTop: "50px", maxWidth: "600px" }}>
      <Paper elevation={3} style={{ padding: "16px" }}>
        <Typography variant="h5" align="left" mb={2}>
          Criar conta
        </Typography>
        <Box display="flex" my={2} flexDirection="column" gap={2}>
          <Typography variant="body1" align="left">
            Informe os seus dados pessoais
          </Typography>
          <form
            onSubmit={handleSubmit(onSubmit)}
            style={{ display: "flex", flexDirection: "column", gap: "16px" }}
          >
            <Box>
              <Controller
                name="name"
                control={control}
                defaultValue=""
                render={({ field }) => (
                  <TextField
                    {...field}
                    label="Nome"
                    variant="outlined"
                    required={true}
                    fullWidth
                    error={!!errors.name}
                    helperText={errors.name ? errors.name.message : ""}
                  />
                )}
              />
            </Box>

            <Box>
              <Controller
                name="email"
                control={control}
                defaultValue=""
                render={({ field }) => (
                  <TextField
                    {...field}
                    label="Email"
                    variant="outlined"
                    type="email"
                    fullWidth
                    required={true}
                    error={!!errors.email}
                    helperText={errors.email ? errors.email.message : ""}
                  />
                )}
              />
            </Box>
            <Box>
              <Controller
                name="password"
                control={control}
                defaultValue=""
                render={({ field }) => (
                  <TextField
                    {...field}
                    label="Senha"
                    variant="outlined"
                    type="password"
                    fullWidth
                    required={true}
                    error={!!errors.password}
                    helperText={errors.password ? errors.password.message : ""}
                  />
                )}
              />
            </Box>
            <Box>
              <Controller
                name="companyName"
                control={control}
                defaultValue=""
                render={({ field }) => (
                  <TextField
                    {...field}
                    label="Nome da empresa"
                    variant="outlined"
                    fullWidth
                    required={true}
                    error={!!errors.companyName}
                    helperText={
                      errors.companyName ? errors.companyName.message : ""
                    }
                  />
                )}
              />
            </Box>
            <Box>
              <Controller
                name="cnpj"
                control={control}
                defaultValue=""
                render={({ field }) => (
                  <TextField
                    {...field}
                    label="CNPJ"
                    variant="outlined"
                    fullWidth
                    required={true}
                    error={!!errors.cnpj}
                    helperText={errors.cnpj ? errors.cnpj.message : ""}
                    inputProps={{
                      maxLength: 14,
                      pattern: "[0-9]*",
                      inputMode: "numeric",
                    }}
                  />
                )}
              />
            </Box>
            <Button
              variant="contained"
              color="primary"
              style={{ maxWidth: "128px", height: "36px" }}
            >
              CRIAR CONTA
            </Button>
          </form>
        </Box>
      </Paper>
    </Container>
  );
};

export default SignupForm;
