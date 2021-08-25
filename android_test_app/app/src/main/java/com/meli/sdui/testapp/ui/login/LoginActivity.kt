package com.meli.sdui.testapp.ui.login

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.meli.sdui.testapp.databinding.ActivityLoginBinding

class LoginActivity : AppCompatActivity() {

    private lateinit var binding: ActivityLoginBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityLoginBinding.inflate(layoutInflater)
        setContentView(binding.root)

        val username = binding.username
        val login = binding.login


        login.setOnClickListener {
            if (username.text.isNotEmpty()){
                startFlutterModule(username.text.toString())
            }
        }
    }

    private fun startFlutterModule(username: String) {
        //TODO will be implemented later
    }

}
