using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Web.Security;
using System.Text;

/// <summary>
///register_addpwd 的摘要说明
/// </summary>
public class register_addpwd
{

    private string s_HashAlgorithm="SHA1";


    public register_addpwd()
	{
	
	}
 
   

    //生成Salt
    public string GenerateSalt()
    {
        byte[] data = new byte[0x10];
        new RNGCryptoServiceProvider().GetBytes(data);
        return Convert.ToBase64String(data);
    }


    //生成密码，选择单向的哈希加密（SHA1）
    public string EncodePassword(string pass, int passwordFormat, string salt)
    {
        if (passwordFormat == 0)   //Clear	密码未加密。 
        {
            return pass;
        }
        byte[] bytes = Encoding.Unicode.GetBytes(pass);
        byte[] src = Convert.FromBase64String(salt);
        byte[] inArray = null;
        if (passwordFormat == 1)  //Hashed	密码使用 SHA1 哈希算法进行单向加密。 您可以使用 hashAlgorithmType 属性指定与 SHA1 算法不同的哈希算法。
        {
            HashAlgorithm hashAlgorithm = HashAlgorithm.Create(s_HashAlgorithm);
            if (hashAlgorithm is KeyedHashAlgorithm)
            {
                KeyedHashAlgorithm algorithm2 = (KeyedHashAlgorithm)hashAlgorithm;
                if (algorithm2.Key.Length == src.Length)
                {
                    algorithm2.Key = src;
                }
                else if (algorithm2.Key.Length < src.Length)
                {
                    byte[] dst = new byte[algorithm2.Key.Length];
                    Buffer.BlockCopy(src, 0, dst, 0, dst.Length);
                    algorithm2.Key = dst;
                }
                else
                {
                    int num2;
                    byte[] buffer5 = new byte[algorithm2.Key.Length];
                    for (int i = 0; i < buffer5.Length; i += num2)
                    {
                        num2 = Math.Min(src.Length, buffer5.Length - i);
                        Buffer.BlockCopy(src, 0, buffer5, i, num2);
                    }
                    algorithm2.Key = buffer5;
                }
                inArray = algorithm2.ComputeHash(bytes);
            }
            else
            {
                byte[] buffer6 = new byte[src.Length + bytes.Length];
                Buffer.BlockCopy(src, 0, buffer6, 0, src.Length);
                Buffer.BlockCopy(bytes, 0, buffer6, src.Length, bytes.Length);
                inArray = hashAlgorithm.ComputeHash(buffer6);
            }
        }
        else            //Encrypted	密码使用由 machineKey 元素（ASP.NET 设置架构） 元素配置确定的加密设置进行加密。
        {
            //byte[] buffer7 = new byte[src.Length + bytes.Length];
            //Buffer.BlockCopy(src, 0, buffer7, 0, src.Length);
            //Buffer.BlockCopy(bytes, 0, buffer7, src.Length, bytes.Length);
            //inArray = this.EncryptPassword(buffer7, this._LegacyPasswordCompatibilityMode);
        }
        return Convert.ToBase64String(inArray);
    }

}