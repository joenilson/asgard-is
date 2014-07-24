<?php
/**
 * Description of Scope
 *
 * @author Joe Nilson <joenilson@gmail.com>
 * 
 * Scope is the class to generate the apropiate code to save content
 * into the content_text table
 * we hace three diferent locations: country, company and location
 * the scope of a document need to have a scope.
 * 
 * The basic matrix is:
 * 
 * Doc\Scope    Country  | Company | Location       
 *          - - - - - - - - - - - - - - - - - -
 * Country   :    CODE   |   CODE  | EMPTYCODE
 * Company   : EMPTYCODE |   CODE  | EMPTYCODE
 * Location  :    CODE   |   CODE  |    CODE
 * 
 * The empty code is by default a varchar(4) 0000
 * 
 */
namespace AsgardLib\Versioning;

class Scope {
    protected $type_scope = null;
    protected $country = null;
    protected $company = null;
    protected $location = null;
    protected $empty_value = "0000";
    protected $scopeObjects;
 
    public function __construct() {
        return $this;
    }
    
    public function setScope($type_scope) {
        switch ($type_scope) {
            case "country":
                $this->type_scope = "country";
                break;
            case "company":
                $this->type_scope = "company";
                break;
            case "location":
                $this->type_scope = "location";
                break;
            default:
                $this->type_scope = "country";
                break;
        }
        return $this->type_scope;
    }
   
    public function setLocationScope($location = null, $type_scope = null)
    {
        $LocationScope = new \stdClass();
        if ($location !== null){
            $LocationScope->location = ($type_scope === 'location')?(string) $location:$this->empty_value;
            $LocationScope->errorMessage = "";
        }else{
            $LocationScope->location = "";
            $LocationScope->errorMessage = "ERROR_NotFound_locationCode";
        }
        return $LocationScope;
    }
    
    public function setCountryScope($country = null, $type_scope = null)
    {
        $CountryScope = new \stdClass();
        if ($country !== null){
            $CountryScope->country = ($type_scope !== 'company')?(string) $country:$this->empty_value;
            $CountryScope->errorMessage = "";
        }else{
            $CountryScope->country = "";
            $CountryScope->errorMessage = "ERROR_NotFound_countryCode";
        }
        return $CountryScope;
    }

    public function setCompanyScope($company = null)
    {
        $CompanyScope = new \stdClass();
        if ($company !== null){
            $CompanyScope->company = (string) $company;
            $CompanyScope->errorMessage = "";
        }else{
            $CompanyScope->company = "";
            $CompanyScope->errorMessage = "ERROR_NotFound_companyCode";
        }
        return $CompanyScope;
    }
    
    public function getScopeParams($country = null, $company = null, $location = null)
    {
        
        $scopeObjects = new \stdClass();
     
        if(empty($country) AND ($country === null))
        {
            $scopeObjects->errorMessage='ERROR_NotFound_countryCode';
            return $scopeObjects;
        }
        
        if(empty($company) AND ($company === null))
        {
            $scopeObjects->errorMessage='ERROR_NotFound_companyCode';
            return $scopeObjects;
        }
        
        if(empty($location) AND ($location === null))
        {
            $scopeObjects->errorMessage='ERROR_NotFound_locationCode';
            return $scopeObjects;
        }
        
        if(($company !== $this->empty_value) AND ($country !== $this->empty_value) AND ($location !== $this->empty_value))
        {
            $type_scope = "location";
        }
        elseif(($company !== $this->empty_value) AND ($country !== $this->empty_value) AND ($location === $this->empty_value))
        {
            $type_scope = "company";
        }
        elseif(($company !== $this->empty_value) AND ($country === $this->empty_value) AND ($location === $this->empty_value))
        {
            $type_scope = "country";
        }
        else
        {
            $scopeObjects->errorMessage='ERROR_NotFound_typeScope';
            return $scopeObjects;
        }

        $scopeObjects->type_scope = $type_scope;
        
        return $scopeObjects;
    }
    
    public function setScopeParams($country = null, $company = null, $location = null, $type_scope = null)
    {
        
        $scopeObjects = new \stdClass();
        
        $type_scope = $this->setScope($type_scope);
        
        $countryScopeValues = $this->setCountryScope($country, $type_scope);
        
        if(!empty($countryScopeValues->errorMessage))
        {
            $scopeObjects->errorMessage=$countryScopeValues->errorMessage;
            return $scopeObjects;
        }
        
        $companyScopeValues = $this->setCompanyScope($company);
        if(!empty($companyScopeValues->errorMessage))
        {
            $scopeObjects->errorMessage=$companyScopeValues->errorMessage;
            return $scopeObjects;
        }
        
        $locationScopeValues = $this->setLocationScope($location, $type_scope);
        if(!empty($locationScopeValues->errorMessage))
        {
            $scopeObjects->errorMessage=$locationScopeValues->errorMessage;
            return $scopeObjects;
        }
        
        $scopeObjects->type_scope = $type_scope;
        $scopeObjects->country_scope = $countryScopeValues->country;
        $scopeObjects->company_scope = $companyScopeValues->company;
        $scopeObjects->location_scope = $locationScopeValues->location;
        
        return $scopeObjects;
    }
            
    
    
}