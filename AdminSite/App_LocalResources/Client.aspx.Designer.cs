﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AdminSite.App_LocalResources {
    using System;
    
    
    /// <summary>
    ///   A strongly-typed resource class, for looking up localized strings, etc.
    /// </summary>
    // This class was auto-generated by the StronglyTypedResourceBuilder
    // class via a tool like ResGen or Visual Studio.
    // To add or remove a member, edit your .ResX file then rerun ResGen
    // with the /str option, or rebuild your VS project.
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("System.Resources.Tools.StronglyTypedResourceBuilder", "16.0.0.0")]
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    public class Client_aspx {
        
        private static global::System.Resources.ResourceManager resourceMan;
        
        private static global::System.Globalization.CultureInfo resourceCulture;
        
        [global::System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")]
        internal Client_aspx() {
        }
        
        /// <summary>
        ///   Returns the cached ResourceManager instance used by this class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        public static global::System.Resources.ResourceManager ResourceManager {
            get {
                if (object.ReferenceEquals(resourceMan, null)) {
                    global::System.Resources.ResourceManager temp = new global::System.Resources.ResourceManager("AdminSite.App_LocalResources.Client.aspx", typeof(Client_aspx).Assembly);
                    resourceMan = temp;
                }
                return resourceMan;
            }
        }
        
        /// <summary>
        ///   Overrides the current thread's CurrentUICulture property for all
        ///   resource lookups using this strongly typed resource class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        public static global::System.Globalization.CultureInfo Culture {
            get {
                return resourceCulture;
            }
            set {
                resourceCulture = value;
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Add.
        /// </summary>
        public static string btnClientAdd_Text {
            get {
                return ResourceManager.GetString("btnClientAdd.Text", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Add new client.
        /// </summary>
        public static string btnClientFormShow_Text {
            get {
                return ResourceManager.GetString("btnClientFormShow.Text", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Client&apos;s name.
        /// </summary>
        public static string lblClient_Text {
            get {
                return ResourceManager.GetString("lblClient.Text", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Client&apos;s e-mail.
        /// </summary>
        public static string lblClientEmail_Text {
            get {
                return ResourceManager.GetString("lblClientEmail.Text", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Clients.
        /// </summary>
        public static string pageTitle {
            get {
                return ResourceManager.GetString("pageTitle", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Please enter valid e-mail.
        /// </summary>
        public static string regexValidatorClientEmail_Text {
            get {
                return ResourceManager.GetString("regexValidatorClientEmail.Text", resourceCulture);
            }
        }
    }
}
